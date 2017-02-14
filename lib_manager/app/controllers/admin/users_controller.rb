class Admin::UsersController < AdminController
  before_action :find_user, except: :index

  def index
    @users = User.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "users.update-success"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "users.delete-success"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :is_admin
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "users.find-danger"
      redirect_to root_url
    end
  end
end
