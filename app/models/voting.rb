class Voting < ActiveRecord::Base
  belongs_to :team

  has_many :voting_entries
end
