class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.bigint :user_id, null: false
      t.string :name
      t.float :amount
      t.timestamps
    end
    add_index :expenses, :user_id, name: "index_expenses_on_user_id"
  end
end
