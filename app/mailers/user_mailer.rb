class UserMailer < ApplicationMailer
  default from: "merakassala@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'merakassala@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
