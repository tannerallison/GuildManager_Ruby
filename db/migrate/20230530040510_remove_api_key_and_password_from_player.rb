class RemoveApiKeyAndPasswordFromPlayer < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :api_key, :string
    remove_column :players, :password, :string
    add_column :players, :password_digest, :string
  end
end
