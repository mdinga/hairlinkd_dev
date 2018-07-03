# Preview all emails at http://localhost:3000/rails/mailers/register_mailer
class RegisterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/register_mailer/new_stylist
  def new_stylist
    stylist = Stylist.last
    RegisterMailer.new_stylist(stylist)
  end

  # Preview this email at http://localhost:3000/rails/mailers/register_mailer/new_client
  def new_client
    client = Client.last
    RegisterMailer.new_client(client)
  end

end
