FactoryBot.define do
  factory :department do
    name { "Deparment_#{SecureRandom.alphanumeric}" } # For uniqueness, create random department name
    company
  end
end
