class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.contact_email(@message).deliver_now
      flash[:notice] = "Your message has been sent!"
      redirect_to new_contact_path
    else
      flash[:alert] = "There was an error sending your message."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
