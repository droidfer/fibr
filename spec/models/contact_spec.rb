require 'rails_helper'

RSpec.describe Contact, type: :model do
  company = FactoryBot.create(:company)
  department = FactoryBot.create(:department, company_id: company.id)
  contact = FactoryBot.create(:contact, company_id: company.id, department_id: department.id)
  
  context 'validate params' do
    it 'Valid contact' do
      expect(FactoryBot.build(:contact, company_id: company.id, department_id: department.id)).to be_valid
    end

    it 'Invalid contact name nil' do
      expect(FactoryBot.build(:contact, company_id: company.id, department_id: department.id, name: nil)).to_not be_valid
    end

    it 'Invalid contact company_id nil' do
      expect(FactoryBot.build(:contact, company_id: nil, department_id: department.id)).to_not be_valid
    end

    it 'Invalid contact department_id nil' do
      expect(FactoryBot.build(:contact, company_id: company.id, department_id: nil)).to_not be_valid
    end
    
    it 'Invalid contact with same name' do
      # The contact cannot be generated again due uniqueness of :name
      expect(FactoryBot.build(:contact, company_id: contact.company_id, department_id: contact.department_id, name: contact.name)).to_not be_valid
    end
  end
end
