class RegisterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_mailer.new_stylist.subject
  #
  def new_stylist(stylist)
    @stylist = stylist
    @username = @stylist.username
    @greeting = "Hi #{@username}"

    mail  to: @stylist.email,
          bcc: "hairlinkd@gmail.com",
          subject: "Welcome to Hairlinkd"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.register_mailer.new_client.subject
  #
  def new_client(client)
    @client = client
    @username = @client.username
    @greeting = "Hi #{@username}"

    mail  to: @client.email,
          bcc: "mbasa.dinga@gmail.com",
          subject: "Welcome to Hairlinkd"
  end

end
