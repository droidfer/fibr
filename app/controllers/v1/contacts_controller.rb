class V1::ContactsController < ApplicationController
  attr_accessor :contact

  before_action :set_contact, only: [:show, :update, :destroy]

  def index
    @contacts = Contact.all
    @contacts
    render :plural
  end

  def show
    contact
    render :single
  end

  def create
    @contact = Contact.create(contact_params )
    head :bad_request if @contact.id.blank?
    @contact
    render :single
  rescue
    head :bad_request
  end

  def update
    contact.name = contact_params[:name] if contact_params[:name]
    contact.title = contact_params[:title] if contact_params[:title]
    contact.landline = contact_params[:landline] if contact_params[:landline]
    contact.mobile_phone = contact_params[:mobile_phone] if contact_params[:mobile_phone]
    contact.email = contact_params[:email] if contact_params[:email]
    contact.department_id = contact_params[:department_id] if contact_params[:department_id]
    contact.company_id = contact_params[:company_id] if contact_params[:company_id]
    head :bad_request unless contact.save
    contact
    render :single
  rescue
    head :bad_request
  end

  def destroy
    contact.destroy
    contact
    render :single
  rescue
    head :bad_request
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  rescue
    head :not_found
  end

  def contact_params
    params.require(:contact).permit(:name, :title, :landline, :mobile_phone, :email, :department_id, :company_id)
  end
end

