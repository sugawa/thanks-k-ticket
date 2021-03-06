class ReservesController < ApplicationController
	def new
    	if check_stock
          @reserve = Reserve.new
        else
          render :soldout
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

  def soldout
  end

  private
    def reserve_params
      params.require(:reserve).permit(:name, :kana, :email, :email_confirmation, :number, :note)
    end

    def check_stock
      # Settingsテーブルから事前予約可能チケットの残分を取得
      @settings = Setting.new
      @reserve = Reserve.new
      stock = Setting.totals.try(:value).to_i - Setting.members.try(:value).to_i
      # 売れたチケットの枚数を取得
      sold = Reserve.sum(:number).to_i
      if stock > sold
        return true
      else
        return false
      end
    end
end
