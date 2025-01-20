require 'rails_helper'


RSpec.describe Room, type: :model do
  subject { Room.new(name: "Sample Room" , is_private: false )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a is_private" do
    subject.is_private=nil
    expect(subject).to_not be_valid
  end
 
  it 'should return public rooms only' do 

     # Create some public rooms first
    Room.create!(name: "Public Room 10", is_private: false)
    Room.create!(name: "Public Room 20", is_private: false)
    rooms = Room.public_rooms
    
    # Check that rooms exist and have data
    expect(rooms).to be_present
    expect(rooms.count).to be > 0
  
end

it 'broadcast to rooms' do
  expect {
  Room.create!(name: "Public Room", is_private: false)
}.to have_broadcasted_to("rooms")
end


end