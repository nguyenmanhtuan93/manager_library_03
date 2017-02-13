class Admin::PublishersController < AdminController
  before_action :find_publisher, except: [:index, :new, :create]

  def index
    @publishers = Publisher.paginate page: params[:page]
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      flash[:success] = t "publisher.create-success"
      redirect_to @publisher
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update_attributes publisher_params
      flash[:success] = t "publisher.update-success"
      redirect_to @publisher
    else
      render :edit
    end
  end

  def destroy
    @publisher.destroy
    flash[:success] = t "publisher.delete-success"
    redirect_to admin_publishers_url
  end

  private
  def publisher_params
    params.require(:publisher).permit :name, :add, :phone, :email
  end

  def find_publisher
    @publisher = Publisher.find_by id: params[:id]
    unless @publisher
      flash[:danger] = t "publisher.find-danger"
      redirect_to root_url
    end
  end
end
