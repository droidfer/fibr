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
    @company = Company.create(
      name: params[:name],
      legal_name: params[:legal_name],
      ruc: params[:ruc],
      url: params[:url],
      description: params[:description]
    )
    head :bad_request if @company.id.blank?
    @company
    render :single
  rescue
    head :bad_request
  end

  def update
    company.name = params[:company][:name] if params[:company][:name]
    company.legal_name = params[:company][:legal_name] if params[:company][:legal_name]
    company.ruc = params[:company][:ruc] if params[:company][:ruc]
    company.url = params[:company][:url] if params[:company][:url]
    company.description = params[:company][:description] if params[:company][:description]
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

end
