class Name < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  has_many :choices, dependent: :destroy
  GENDER = ["girl", "boy", "unisex"]
  ORIGIN = ["french", "english", "hebrew", "latin"]
  ASTROLOGY = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
  POPULARITY = ["rare", "common", "popular"]
  validates :gender, inclusion: { in: GENDER }
  validates :astrology, inclusion: { in: ASTROLOGY }
  validates :popularity, inclusion: { in: POPULARITY }
  validates_intersection_of :origin, in: ORIGIN, message: "invalid permission"
  validates_intersection_of :origin, within: ORIGIN, message: "invalid permission"
  
  # validate :test
  # private
  # def test
  #   if origin.detect{ |e| !ORIGIN.include?(e) }
  #     errors.add(:origin, :invalid)
  #   end
  # end

end
