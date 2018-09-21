class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :cost
      t.integer :quantity
      t.integer  :event_id
      t.timestamps
    end
  end
end
