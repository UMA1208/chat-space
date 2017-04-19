class GroupsController < ApplicationController

  def new
    @user = current_user
    @group = Group.new
  end

  def create
  end

  def edit
  end
end
