class ContactMailer < ApplicationMailer
  default from: ENV['SMTP_USER']

  def contact_email(message)
    @message = message
    mail(to: 'fukudesignandco@gmail.com', subject: 'New Contact Message')
  end
end
