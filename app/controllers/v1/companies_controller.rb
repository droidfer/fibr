class V1::CompaniesController < ApplicationController
  attr_accessor :company

  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = Company.all
    @companies
    render :plural
  end

  def show
    company
    render :unico
  rescue
    head :not_found
  end

  def create
    @company = Company.create(
      name: params[:name],
      legal_name: params[:legal_name],
      ruc: params[:ruc],
      url: params[:url],
      description: params[:description]
    )

    @company
    render :unico
  rescue
    head :bad_request
  end

  def update
    company.name = params[:name] if params[:name]
    company.legal_name = params[:legal_name] if params[:legal_name]
    company.ruc = params[:ruc] if params[:ruc]
    company.url = params[:url] if params[:url]
    company.description = params[:description] if params[:description]
    company.save
    company
    render :unico
  rescue
    head :bad_request
  end

  def destroy
    company.destroy
    company
    render :unico
  rescue
    head :bad_request
  end

  private
  
  def set_company
    begin
      @company = Company.find(params[:id])
    rescue
      head :not_found
    end
  end

end
