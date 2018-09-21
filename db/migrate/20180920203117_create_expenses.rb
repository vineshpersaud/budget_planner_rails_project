class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :cost, :precision => 8, :scale => 2
      t.integer :quantity
      t.integer  :event_id
      t.timestamps
    end
  end
end
