class MakePlayerOnMinionOptional < ActiveRecord::Migration[7.0]
  def change
    change_column_null :minions, :player_id, true
  end
end
