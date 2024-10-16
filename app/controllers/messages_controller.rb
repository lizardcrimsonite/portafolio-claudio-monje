class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    
    if @message.save
      ContactMailer.contact_email(@message).deliver_now
      flash[:success] = "Your message has been sent!"
      redirect_to contact_path
    else
      flash[:error] = "There was an error sending your message."
      render 'pages/contact'
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
