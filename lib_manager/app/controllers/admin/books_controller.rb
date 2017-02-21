class Admin::BooksController < AdminController
  include ApplicationHelper

  before_action :logged_in_user, :verify_admin
  before_action :load_all_categories, :load_all_authors, :load_all_publishers
  before_action :find_book, except: [:index, :new, :create]

  def index
    @books = Book.sort_by_create_at
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "books.new-page.success"
      redirect_to @book
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      redirect_to admins_books_path
      flash[:success] = t "books.edit-page.success"
    else
      render :edit
      flash[:danger] = t "books.edit-page.danger"
    end
  end

  def destroy
    @book.destroy
    flash[:success] = t "books.index-page.delete"
    redirect_to admins_books_path
  end

  private
  def book_params
    params.require(:book).permit :name, :numbers_page, :year, :languages,
      :picture, :numbers_initial, :publisher_id
  end

  def find_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "books.controller.no-exist"
      redirect_to admins_books_path
    end
  end

  def load_all_categories
    @categories = Category.select "id, name"
  end

  def load_all_authors
    @authors = Author.select "id, name"
  end

  def load_all_publishers
    @publishers = Publisher.select "id, name"
  end
end
