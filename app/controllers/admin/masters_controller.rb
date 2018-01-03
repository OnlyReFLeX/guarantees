class Admin::MastersController < Admin::AdminController
    before_action :masters_all, only: [:new, :create]
    before_action :find_id, only: [:destroy, :update]
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

    def update
      @master.update(master_params)
    end

    def destroy
      @master.destroy
    end


    private
    def masters_all
      @masters = Master.all.paginate(:per_page => 10, :page => params[:page])
    end

    def find_id
      @master = Master.find(params[:id])
    end
    def master_params
      params.require(:master).permit(:name)
    end
end
