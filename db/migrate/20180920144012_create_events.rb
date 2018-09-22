class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.decimal :budget, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
