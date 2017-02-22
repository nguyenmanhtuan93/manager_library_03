class Admin::UsersController < AdminController
  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = User.search_user(params[:search_user])
      .search_permission(params[:search_permission])
      .paginate page: params[:page]
    respond_to do |format|
      format.html
      format.js
      format.xls {send_data @users.to_xls(col_sep: "\t")}
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "static_pages.welcome"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to admin_users_path
      flash[:success] = t "users.update-success"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "users.delete-success"
    redirect_to admin_users_path
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
      redirect_to admin_users_path
    end
  end
end
