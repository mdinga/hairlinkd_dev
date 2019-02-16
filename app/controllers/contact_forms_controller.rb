class ContactFormsController < ApplicationController

  layout 'menu'

  def index
  end

  def show
  end

  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_params)

    if @contact.save
      FormMailer.new_message(@contact).deliver_now
      flash[:notice] = "We received your message, thanks!!!"
      redirect_to (root_path)
    else
      flash[:notice] = "Oops, something went wrong, please try again later"
      render ("new")
    end
  end

  def destroy
  end

  private

    def contact_params
        params.require(:contact_form).permit(:name, :email, :phone, :message, :nickname)
    end


end
