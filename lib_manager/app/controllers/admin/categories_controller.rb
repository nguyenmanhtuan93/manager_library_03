class Admin::CategoriesController < AdminController
  include Categories

  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.create-success"
      redirect_to @category
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "category.update-success"
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "category.delete-success"
    else
      flash[:danger] = t "category.delete-danger"
    end
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :name
  end
end
