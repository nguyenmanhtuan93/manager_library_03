class Admin::AuthorsController < AdminController
  include Authors

  before_action :find_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.paginate page: params[:page]
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t "author.create-success"
      redirect_to @author
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update_attributes author_params
      flash[:success] = t "author.update-success"
      redirect_to @author
    else
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t "author.delete-success"
    else
      flash[:danger] = t "author.delete-danger"
    end
    redirect_to admin_authors_url
  end

  private
  def author_params
    params.require(:author).permit :name, :email
  end
end
