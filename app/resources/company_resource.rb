class CompanyResource < JSONAPI::Resource
  attributes :name, :legal_name, :ruc, :url, :description
  has_many :departments
  has_many :contacts
end