class RegisterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_mailer.new_stylist.subject
  #
  def new_stylist
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_mailer.new_client.subject
  #
  def new_client
    @greeting = "Hi"

    mail to: "mbasa.dinga@gmail.com",
        subject: "Welcome to Hairlinkd"
  end
  
end
