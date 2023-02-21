require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'validate params' do
    company = FactoryBot.create(:company)
    
    it 'Valid company' do
      expect(FactoryBot.build(:company)).to be_valid
    end

    it 'Valid company with nil not name' do
      company_min = FactoryBot.build(:company, legal_name: nil, ruc: nil, url: nil, description: nil)
      expect(company_min).to be_valid
    end

    it 'Invalid company with nil name' do
      expect(FactoryBot.build(:company, name: nil)).to_not be_valid
    end

    it 'Invalid company with same name' do
      # The company cannot be generated again due uniqueness of :name
      expect(FactoryBot.build(:company, name: company.name)).to_not be_valid
    end
  end
end
