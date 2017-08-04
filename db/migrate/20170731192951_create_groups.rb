class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :info
      t.text :member

      t.timestamps
    end
  end
end
