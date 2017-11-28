class Admin::MastersController < Admin::AdminController

    def new
      @master = Master.new
      @masters = Master.all
    end

    def create
      @masters = Master.all
      @master = Master.new(master_params)

      if @master.valid?
        @master.save
        redirect_to new_admin_master_path
      else
        render action: 'new'
      end
    end

    def destroy
      Master.find(params[:id]).destroy
      redirect_to :action => 'new'
    end


    private
    def master_params
      params.require(:master).permit(:name)
    end
end
