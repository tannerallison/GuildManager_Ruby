class CreateMinions < ActiveRecord::Migration[7.0]
  def change
    create_table :minions do |t|
      t.string :name
      t.integer :status
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
