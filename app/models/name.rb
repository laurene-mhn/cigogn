class Name < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
end
