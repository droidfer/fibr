FactoryBot.define do
  factory :company do
    name { "Company_#{SecureRandom.alphanumeric}" } # For uniqueness, create random company name
    legal_name { "Legal Name" }
    ruc { "tax_id 123232" }
    url { "https://company_telco.com/" }
    description { "Telecom Company" }
  end
end
