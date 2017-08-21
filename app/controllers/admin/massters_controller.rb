class Admin::MasstersController < Admin::AdminController

    def new
      @massters = Masster.all
    end

    def create
      @massters = Masster.all
      @masster = Masster.new(master_params)

      if @masster.valid?
        @masster.save
        redirect_to new_admin_masster_path
      else
        render action: 'new'
      end
    end

    def destroy
      Masster.find(params[:id]).destroy
      redirect_to :action => 'new'
    end


    private
    def master_params
      params.require(:masster).permit(:name)
    end
end
