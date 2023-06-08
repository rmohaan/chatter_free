class ChatroomController < ApplicationController
  before_action :require_user, only: [:index, :create]
  
  def index
    @messages = Message.custom_display
    @users = User.all
  end

  def create
    message = Message.new(message_params)
    message.user = logged_user

    if message && message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    message_html: generate_html(message)
      # redirect_to root_path
    else
      flash[:alert] = "Message sending failed"
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def generate_html(message)
    render(partial: 'messages/message', locals: {message: message})
  end
end