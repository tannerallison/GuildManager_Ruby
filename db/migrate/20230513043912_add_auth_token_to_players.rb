class AddAuthTokenToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :authentication_token, :string, limit: 30
    add_index :players, :authentication_token, unique: true
  end
end
