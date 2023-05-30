class CreateJoinTableJobMinion < ActiveRecord::Migration[7.0]
  def change
    create_join_table :jobs, :minions do |t|
      t.index [:job_id, :minion_id]
      t.index [:minion_id, :job_id]
    end
  end
end
