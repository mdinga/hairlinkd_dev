# Preview all emails at http://localhost:3000/rails/mailers/register_mailer
class RegisterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/register_mailer/new_stylist
  def new_stylist
    RegisterMailer.new_stylist
  end

  # Preview this email at http://localhost:3000/rails/mailers/register_mailer/new_client
  def new_client
    RegisterMailer.new_client
  end

end
