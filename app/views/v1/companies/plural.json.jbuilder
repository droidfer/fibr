json.array! @companies do |company|
  json.set! :object, 'company'
  json.id company.id
  json.name company.name
  json.legal_name company.legal_name
  json.ruc company.url
  json.description company.description
end