class RemoveGroupNameFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :group_name, :integer
  end
end
