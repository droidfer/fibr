require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  contact = FactoryBot.create(:contact)
  
  it 'get list of contacts' do
    get '/v1/contacts'
    expect(response.status).to eq(200)
  end

  it 'show contact' do
    get "/v1/contacts/#{contact.id}"
    expect(response.status).to eq(200)

    json = JSON.parse(response.body).deep_symbolize_keys

    expect(json).to eq({
                         object: "contact",
                         id: contact.id,
                         name: contact.name,
                         title: contact.title,
                         email: contact.email,
                         landline: contact.landline,
                         mobile_phone: contact.mobile_phone,
                         department: {
                           id: contact.department.id,
                           name: contact.department.name
                         },
                         company: {
                           id: contact.company.id,
                           name: contact.company.name,
                           ruc: contact.company.ruc,
                           url: contact.company.url,
                           description: contact.company.description,
                         } 
                       })
  end

  it 'update contact' do
    put "/v1/contacts/#{contact.id}", :params => {:contact => { title: 'new-title'}}
    expect(response.status).to eq(200)

    contact.reload
    expect(contact.title).to eq('new-title')

    json = JSON.parse(response.body).deep_symbolize_keys

    expect(json).to eq({
                         object: "contact",
                         id: contact.id,
                         name: contact.name,
                         title: contact.title,
                         email: contact.email,
                         landline: contact.landline,
                         mobile_phone: contact.mobile_phone,
                         department: {
                           id: contact.department.id,
                           name: contact.department.name
                         },
                         company: {
                           id: contact.company.id,
                           name: contact.company.name,
                           ruc: contact.company.ruc,
                           url: contact.company.url,
                           description: contact.company.description,
                         }
                       })
  end

  it 'destroy contact' do
    delete "/v1/contacts/#{contact.id}"
    expect(response.status).to eq(200)

    del_contact = Contact.where(id: contact.id)
    expect(del_contact.blank?).to eq(true)
  end
  
end
