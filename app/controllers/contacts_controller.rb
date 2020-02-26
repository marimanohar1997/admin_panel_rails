class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :authorize_request, only: [:contact_list,:find_contact,:create,:contact_update,:contact_delete]
  
  def contact_list
    @contacts = Contact.all
    render json: @contacts
  end

  def find_contact
    @contacts = Contact.find(params[:id])
    render json: @contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
      if @contact.save
        render json: @contact
      else
        render json: "not created"
      end
  end

  def contact_update
    @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
        render json: "Contact updated successfully"
      else
        render json: "not created"
      end
  end

  def contact_delete
    @contact =  Contact.find(params[:id])
    @contact.destroy
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :address, :city, :mobile, :description, :pincode)
    end
end
