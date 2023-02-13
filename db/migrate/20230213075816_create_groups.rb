class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.bigint :user_id, null: false
      t.string :name
      t.string :icon
      t.timestamps
    end
    add_index :groups, :user_id, name: "index_groups_on_user_id"
  end
end
