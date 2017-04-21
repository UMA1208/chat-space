class AddGroupNameToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :group_name, :string
  end
end
