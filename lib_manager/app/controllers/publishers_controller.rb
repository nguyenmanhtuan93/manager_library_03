class PublishersController < ApplicationController
  before_action :logged_in_user

  def show
    @publisher = Publisher.find_by id: params[:id]
    unless @publisher
      flash[:danger] = t "publisher.find-danger"
      redirect_to root_url
    end
  end
end
