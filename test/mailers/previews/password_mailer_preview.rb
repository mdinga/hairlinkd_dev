# Preview all emails at http://localhost:3000/rails/mailers/password_mailer
class PasswordMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password_mailer/reset_password
  def reset_password
    client = Client.last
    PasswordMailer.reset_password(client)
  end

end
