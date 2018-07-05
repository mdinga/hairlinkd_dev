class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset_password.subject
  #
  def reset_password_client(user)
    @user = user
    @greeting = "Hi #{@user.username}"

    mail  to: @user.email,
          bcc: "hairlinkd@gmail.com",
          subject: "Password Reset"
  end

  def reset_password_stylist(user)
    @user = user
    @greeting = "Hi #{@user.username}"

    mail  to: @user.email,
          bcc: "hairlinkd@gmail.com",
          subject: "Password Reset"
  end

end
