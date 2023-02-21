class Company < ApplicationRecord
  has_many :departments
  has_many :contacts
  
  validates :name, presence: true, uniqueness: { scope: :name }
end
