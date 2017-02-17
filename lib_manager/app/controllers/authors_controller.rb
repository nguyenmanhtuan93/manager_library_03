class AuthorsController < ApplicationController
  include Authors

  before_action :logged_in_user, :find_author

  def show
  end
end
