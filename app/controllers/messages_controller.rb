class MessagesController < ApplicationController

    def create
        # @message =current_user.messages.create(body: msg_params[:body], room_id: params[:room_id] )
        @current_user = current_user
        @message = @current_user.messages.create(body: msg_params[:body], room_id: params[:room_id])
    end
    def msg_params
        params.require(:message).permit(:body)
    end
end
