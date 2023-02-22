
  json.set! :object, 'department'
  json.id @department.id
  json.name @department.name
  json.company do
    json.id @department.company.id
    json.name @department.company.name
    json.ruc @department.company.ruc
    json.url @department.company.url
    json.description @department.company.description
  end
