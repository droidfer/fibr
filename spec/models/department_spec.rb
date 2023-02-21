require 'rails_helper'

RSpec.describe Department, type: :model do
  company = FactoryBot.create(:company)
  department = FactoryBot.create(:department, company_id: company.id)

  context 'validate params' do
    it 'Valid department' do
      expect(FactoryBot.build(:department, company_id: company.id)).to be_valid
    end
    
    it 'Invalid department name nil' do
      expect(FactoryBot.build(:department, name: nil)).to_not be_valid
    end

    it 'Invalid department company_id nil' do
      expect(FactoryBot.build(:department, company_id: nil)).to_not be_valid
    end

    it 'Invalid department with same name' do
      # The department cannot be generated again due uniqueness of :name
      expect(FactoryBot.build(:department, company_id: department.company_id, name: department.name)).to_not be_valid
    end
  end
end
