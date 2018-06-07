# Preview all emails at http://localhost:3000/rails/mailers/form_mailer
class FormMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/form_mailer/new_message
  def new_message
    FormMailer.new_message
  end

end
