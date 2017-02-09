class RelationshipsController < ApplicationController

  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow @user
    @relation = current_user.active_relationships.find_by followed_id: @user.id
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    @relation = current_user.active_relationships.build
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
