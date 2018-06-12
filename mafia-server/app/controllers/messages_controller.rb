class MessagesController < ApplicationController
  before_action :check_if_logged_in

  def create

    @message = Message.new message_params
    @message.user = @current_user

    if @message.save
      # render :broadcast

      p @message.text_body
      p @message.user

      ActionCable.server.broadcast 'messages',
        message: @message.text_body,
        user: @message.user.name
        head :ok
    # else
    #   binding.pry
    end

    # raise "hell"

      # redirect_to room_path params[:room_id] and return


    # if message.persisted?
    #   redirect_to room_path params[:room_id]
    # else
    #   flash[:errors] = message.errors.full_messages
    #   redirect_to room_path params[:room_id]
    # end
  end



  private

    def message_params
      params.require(:message).permit(:text_body, :room_id)
    end
end
