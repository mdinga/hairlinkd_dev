class FormMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.form_mailer.new_message.subject
  #
  def new_message(contact)
    @contact = contact
    @name = @contact.name
    @email = @contact.email
    @message = @contact.message

    mail  to: "hairlinkd@gmail.com",
          from: @email,
          subject: "General Contact Form: #{@name}"
  end
end
