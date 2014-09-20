class Team < ActiveRecord::Base
  has_many   :members, class_name: 'User'
  belongs_to :leader,  class_name: 'User'

  has_many   :votings
end
