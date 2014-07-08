class ReservesController < ApplicationController
	def new
    	@reserve = Reserve.new
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
end
