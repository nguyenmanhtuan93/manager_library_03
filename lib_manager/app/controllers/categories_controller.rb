class CategoriesController < ApplicationController
  include Categories

  before_action :logged_in_user, :find_category

  def show
  end
end
