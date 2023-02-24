
  json.set! :object, 'contact'
  json.id @contact.id
  json.name @contact.name
  json.title @contact.title
  json.email @contact.email
  json.landline @contact.landline
  json.mobile_phone @contact.mobile_phone
  json.department @contact.department.name
  
  json.company do
    json.id @contact.company.id
    json.name @contact.company.name
    json.ruc @contact.company.ruc
    json.url @contact.company.url
    json.description @contact.company.description
  end
