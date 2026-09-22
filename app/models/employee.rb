class Employee < ApplicationRecord
  belongs_to :employer

  validates :name, presence: true
  validates :external_ref, uniqueness: { scope: :employer_id }
end
