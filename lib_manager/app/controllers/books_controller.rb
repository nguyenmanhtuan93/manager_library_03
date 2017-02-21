class BooksController < ApplicationController
  include ApplicationHelper

  before_action :load_all_categories, :load_all_authors, :load_all_publishers
  before_action :find_book, only: :show

  def index
    @books = Book.sort_by_create_at
  end

  def show
  end

  private
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
