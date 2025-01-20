class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, 
         password_length: 4..128  # Reduce minimum password length to 4

  scope :all_except , -> (user) {where.not(id: user)}
  after_create_commit {broadcast_append_to "users"}
  has_many :messages
end
