class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password
      t.string :api_key

      t.timestamps
    end
  end
end
