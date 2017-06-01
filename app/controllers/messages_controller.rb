class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user_id)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@message.group_id), alert: 'メッセージが送信されました'
    else
      redirect_to group_messages_path(@message.group_id), alert: 'メッセージの送信に失敗しました'
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end