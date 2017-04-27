class MessagesController < ApplicationController

  before_action :move_to_log_in
  def index
    @groups = current_user.groups
    # @group = Group.find(params[:group_id])
  end

  private
  def move_to_log_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end
