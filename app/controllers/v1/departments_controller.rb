class V1::DepartmentsController < ApplicationController
  attr_accessor :department

  before_action :set_department, only: [:show, :update, :destroy]

  def index
    @departments = Department.all
    @departments
    render :plural
  end

  def show
    department
    render :single
  end

  def create
    @department = Department.create(department_params)
    head :bad_request if @department.id.blank?
    @department
    render :single
  rescue
    head :bad_request
  end

  def update
    department.name = department_params[:name] if department_params[:name]
    department.company_id = department_params[:company_id] if department_params[:company_id]
    head :bad_request unless department.save
    department
    render :single
  rescue
    head :bad_request
  end

  def destroy
    department.destroy
    department
    render :single
  rescue
    head :bad_request
  end

  private

  def set_department
    @department = Department.find(params[:id])
  rescue
    head :not_found
  end

  def department_params
    params.require(:department).permit(:name, :company_id)
  end
end
