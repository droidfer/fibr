FactoryBot.define do
  factory :contact do
    name { "Contact_#{SecureRandom.alphanumeric}" } # For uniqueness, create random contact name
    title { "Contact Title" }
    landline { "023 654 7987" }
    mobile_phone { "+59 654 3213" }
    email { "contact@email.com" }
    department
    company
  end
end
