class CreateVotingEntries < ActiveRecord::Migration
  def change
    create_table :voting_entries do |t|
      t.integer  :voting_id
      t.integer  :amount
      t.integer  :member_id

      t.timestamps
    end
  end
end
