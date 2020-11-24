class Name < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  has_many :choices, dependent: :destroy
end
