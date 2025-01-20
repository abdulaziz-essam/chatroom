require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  # Create a user to log in
  let!(:user) { User.create!(email: "test@example.com", password: "password123") }

  # Create public rooms before tests
  let!(:public_room1) { Room.create!(name: "Public Room 11", is_private: false) }
  let!(:public_room2) { Room.create!(name: "Public Room 21", is_private: false) }
  let!(:private_room) { Room.create!(name: "Private Room", is_private: true) }

  before do
    # Use Devise test helpers for authentication
    sign_in user
  end

  describe "GET /rooms" do
    it "returns http success" do
      
        get rooms_path
        
     
        
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Public Room 11")
        expect(response.body).to include("Public Room 21")
    
      
    end

    it "returns only public rooms" do 
      rooms = Room.public_rooms
      
      expect(rooms).to be_present
      expect(rooms.count).to be >0
      expect(rooms).to include(public_room1, public_room2)
      expect(rooms).not_to include(private_room)
    end
  end

  describe "GET /rooms/{id}" do
    it "returns http success for an existing room" do
      begin
        get room_path(public_room1)
        
        # Debugging information
        puts "Response status: #{response.status}"
        puts "Response body: #{response.body}"
        puts "Room details: #{public_room1.attributes}"
        
        expect(response).to have_http_status(:success)
      rescue => e
        puts "Error in room show test: #{e.message}"
        puts e.backtrace.join("\n")
        raise
      end
    end

    it "returns correct room details" do
      # Reload the room to ensure we have the latest data from the database
      reloaded_room = Room.find(public_room1.id)
      
      expect(reloaded_room.name).to eq('Public Room 11')
      expect(reloaded_room.is_private).to be(false)
    end
  end
end