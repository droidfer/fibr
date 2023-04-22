require 'rails_helper'

RSpec.describe "Departments", type: :request do
  department = FactoryBot.create(:department)

  it 'get list of departments' do
    get '/v1/departments'
    expect(response.status).to eq(200)
  end

  it 'show department' do
    get "/v1/departments/#{department.id}"
    expect(response.status).to eq(200)

    json = JSON.parse(response.body).deep_symbolize_keys

    expect(json).to eq({
                         object: "department",
                         id: department.id,
                         name: department.name,
                         company: {
                           id: department.company.id,
                           name: department.company.name,
                           ruc: department.company.ruc,
                           url: department.company.url,
                           description: department.company.description,
                         }
                       })
  end

  it 'update department' do
    put "/v1/departments/#{department.id}", :params => {:department => { name: 'new-name'}}
    expect(response.status).to eq(200)

    department.reload
    expect(department.name).to eq('new-name')

    json = JSON.parse(response.body).deep_symbolize_keys

    expect(json).to eq({
                         object: "department",
                         id: department.id,
                         name: department.name,
                         company: {
                           id: department.company.id,
                           name: department.company.name,
                           ruc: department.company.ruc,
                           url: department.company.url,
                           description: department.company.description,
                         }
                       })
  end

  it 'destroy department' do
    delete "/v1/departments/#{department.id}"
    expect(response.status).to eq(200)

    del_department = Department.where(id: department.id)
    expect(del_department.blank?).to eq(true)
  end
  
end
