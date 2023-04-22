require 'rails_helper'

RSpec.describe "Companies", type: :request do
  company = FactoryBot.create(:company)

  it 'get list of companies' do
    get '/v1/companies'
    expect(response.status).to eq(200)
  end

  it 'show company' do
    get "/v1/companies/#{company.id}"
    expect(response.status).to eq(200)
    
    json = JSON.parse(response.body).deep_symbolize_keys

    expect(json).to eq({
                         object: "company",
                         id: company.id,
                         name: company.name,
                         legal_name: company.legal_name,
                         ruc: company.ruc,
                         url: company.url,
                         description: company.description,
                         contacts: company.contacts
                       })
  end
  
  it 'update company' do
    put "/v1/companies/#{company.id}", :params => {:company => { ruc: 'tax_123'}}
    expect(response.status).to eq(200)
    
    company.reload
    expect(company.ruc).to eq('tax_123')
    
    json = JSON.parse(response.body).deep_symbolize_keys
    expect(json).to eq({
                         object: "company",
                         id: company.id,
                         name: company.name,
                         legal_name: company.legal_name,
                         ruc: company.ruc,
                         url: company.url,
                         description: company.description,
                         contacts: company.contacts
                       })
    
  end
  
  it 'destroy company' do
    delete "/v1/companies/#{company.id}"
    expect(response.status).to eq(200)
    
    del_company = Company.where(id: company.id)
    expect(del_company.blank?).to eq(true)
  end

end
