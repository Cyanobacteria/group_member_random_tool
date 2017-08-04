class AddColumnMemberRToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :member_r, :text
  end
end
