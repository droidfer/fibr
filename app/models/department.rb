class Department < ApplicationRecord
  belongs_to :company
  has_many :contacts
  
  validates :name, :company_id, presence: true, uniqueness: { scope: :name }
end
