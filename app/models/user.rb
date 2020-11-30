require 'securerandom'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :partner, class_name: "User", optional: true
  has_many :choices, dependent: :destroy
  has_one :filter, dependent: :destroy
  has_one_attached :photo
  after_validation :generate_code, on: :create

  private

  def generate_code
    self.code = SecureRandom.alphanumeric
  end
end
