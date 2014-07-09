class ReservesController < ApplicationController
	def new
    	if check_stock
          @reserve = Reserve.new
        else
          render templete: 'reserves/soldout'
        end
    end

    def create
	    @reserve = Reserve.new(reserve_params)
	    
	    respond_to do |format|
        if @reserve.save
           MailSender.entry(@reserve).deliver #MailSender.entryに@reserveを渡す
           format.html { render action: 'complete' }
        else
           format.html { render action: 'new', notice: 'error'  }
        end
       end
    end

	def confirm
		@reserve = Reserve.new(reserve_params)
	    respond_to do |format|
        if @reserve.valid?
           format.html
        else
           format.html { render action: 'new', notice: 'error'  }
        end
       end
	end

  private
    def reserve_params
      params.require(:reserve).permit(:name, :kana, :email, :email_confirmation, :number, :note)
    end

    def check_stock
      # Settingsテーブルから事前予約可能チケットの残分を取得
      @settings = Setting.new
      @reserve = Reserve.new
      stock = @settings.class.where("name = 'totals'").limit(1).pluck(:value).first.to_i - @settings.class.where("name = 'members'").limit(1).pluck(:value).first.to_i
      # 売れたチケットの枚数を取得
      sold = @reserve.class.sum(:number).to_i
      if stock > sold
        return true
      else
        return false
      end
    end
end
