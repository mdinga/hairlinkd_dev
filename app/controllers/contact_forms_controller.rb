class ContactFormsController < ApplicationController

  layout 'home'

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
      flash[:notice] = "Form Saved Successfully"
    else
      render ("new")
    end
  end

  def destroy
  end

  private

    def contact_params
        params.require(:contact_form).permit(:name, :email, :phone, :message)
    end


end
