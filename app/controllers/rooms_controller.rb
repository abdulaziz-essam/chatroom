class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(current_user)
  end

  def show  
    @single_room = Room.find(params[:id])
    @room = Room.new
    @rooms = Room.public_rooms
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    @users = User.all_except(current_user)
    render 'index'
  end

  def create 
    @room = Room.new(room_params)
    if @room.save
      # Redirect to the new room's show page after creation
      redirect_to room_path(@room), notice: 'Room was successfully created.'
    else
      # If creation failed, re-render the index page (or handle errors accordingly)
      @rooms = Room.public_rooms
      @users = User.all_except(current_user)
      render :index
    end
  end

  private

  def room_params
    # Strong parameters to safely allow room name to be submitted
    params.require(:room).permit(:name)
  end
end