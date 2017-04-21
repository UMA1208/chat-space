class GroupsController < ApplicationController

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group.id), notice: 'グループが作成されました'
    else
      flash.now[:aleat] = 'グループ作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name, {user_ids:[]})
  end
end
