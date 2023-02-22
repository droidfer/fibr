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
    render :single
  rescue
    head :not_found
  end

  def create
    @company = Company.create(company_params)
    head :bad_request if @company.id.blank?
    @company
    render :single
  rescue
    head :bad_request
  end

  def update
    company.name = company_params[:name] if company_params[:name]
    company.legal_name = company_params[:legal_name] if company_params[:legal_name]
    company.ruc = company_params[:ruc] if company_params[:ruc]
    company.url = company_params[:url] if company_params[:url]
    company.description = company_params[:description] if company_params[:description]
    head :bad_request unless company.save
    company
    render :single
  rescue
    head :bad_request
  end

  def destroy
    company.destroy
    company
    render :single
  rescue
    head :bad_request
  end

  private

  def set_company
    @company = Company.find(params[:id])
  rescue
    head :not_found
  end
  
  def company_params
    params.require(:company).permit(:name, :legal_name, :url, :description, :ruc)
  end

end
