class Message < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :room_id, presence: true
  
  belongs_to :user
  belongs_to :room
  
  after_create_commit {broadcast_append_to self.room}
  before_create :confirm_participant

  def confirm_participant 
  return unless room.is_private
    is_participant =Participant.where(user_id: user.id, room_id: room.id).first
    throw :abort unless is_participant
  end
end
