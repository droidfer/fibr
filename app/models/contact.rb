class Contact < ApplicationRecord
  belongs_to :company
  belongs_to :department

  validates :name, :company_id, :department_id, presence: true, uniqueness: { scope: :name }
end
