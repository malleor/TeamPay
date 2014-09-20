class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.integer :team_id
      t.integer :total

      t.timestamps
    end
  end
end
