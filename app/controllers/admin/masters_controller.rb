class Admin::MastersController < Admin::AdminController
    before_action :masters_all, only: [:new, :create]
    def new
      @master = Master.new
    end

    def create
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

    def masters_all
      @masters = Master.all.paginate(:per_page => 10, :page => params[:page])
    end

    private
    def master_params
      params.require(:master).permit(:name)
    end
end
