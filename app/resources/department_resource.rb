class DepartmentResource < JSONAPI::Resource
  attributes :name
  
  has_one :company
end