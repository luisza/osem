class QanswersRegistrations < ActiveRecord::Base
  belongs_to :qanswer
  belongs_to :registrations
  validates :textarea, presence: false

end
