class ContactMailer < ActionMailer::Base

  default to: 'samir.arap@gmail.com'

  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'Message form Contact Form')
  end
end