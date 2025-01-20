require 'rails_helper'

RSpec.describe Message, type: :model do
  # Create a user and room before each test
  let(:user) { User.create!(email: "test@example.com", password: "password123") }
  let(:room) { Room.create!(name: "Test Room", is_private: false) }

  # Create a subject using the created user and room
  subject { 
    Message.new(
      body: "Sample Message", 
      user_id: user.id, 
      room_id: room.id
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a body" do
    subject.body = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a room_id" do
    subject.room_id = nil
    expect(subject).to_not be_valid
  end
end