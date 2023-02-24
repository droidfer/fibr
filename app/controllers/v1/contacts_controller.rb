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
    render :unico
  end

  def create
    @contact = Contact.create(
      name: params[:name],
      title: params[:title],
      landline: params[:landline],
      mobile_phone: params[:mobile_phone],
      email: params[:email],
      department_id: params[:department_id],
      company_id: params[:company_id]
    )
    head :bad_request if @contact.id.blank?
    @contact
    render :unico
  rescue
    head :bad_request
  end

  def update
    contact.name = params[:name] if params[:name]
    contact.company_id = params[:title] if params[:title]
    contact.company_id = params[:landline] if params[:landline]
    contact.company_id = params[:mobile_phone] if params[:mobile_phone]
    contact.company_id = params[:email] if params[:company_id]
    contact.company_id = params[:department_id] if params[:department_id]
    contact.company_id = params[:company_id] if params[:company_id]
    head :bad_request unless contact.save
    contact
    render :unico
  rescue
    head :bad_request
  end

  def destroy
    contact.destroy
    contact
    render :unico
  rescue
    head :bad_request
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  rescue
    head :not_found
  end
end

