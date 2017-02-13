class AdminController < ApplicationController
  before_action :logged_in_user, :verify_admin
end
