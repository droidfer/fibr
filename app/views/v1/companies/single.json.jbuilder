json.set! :object, 'company'
json.id @company.id
json.name @company.name
json.legal_name @company.legal_name
json.ruc @company.ruc
json.url @company.url
json.description @company.description
json.contacts @company.contacts.each do |contact|
  json.id contact.id
  json.name contact.name
  json.title contact.title
  json.deparment contact.department
end