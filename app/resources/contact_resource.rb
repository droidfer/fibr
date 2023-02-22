class ContactResource < JSONAPI::Resource
  attributes :name, :title, :landline, :mobile_phone, :email
  
  has_one :company
  has_one :department
end