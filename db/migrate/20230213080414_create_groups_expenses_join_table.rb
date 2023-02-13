class CreateGroupsExpensesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_expenses, id: false do |t|
      t.bigint :group_id, null: false
      t.bigint :expense_id, null: false
    end
    add_index :groups_expenses, [:group_id, :expense_id], unique: true
  end
end
