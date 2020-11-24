class Name < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  has_many :choices, dependent: :destroy
  GENDER = ["girl", "boy", "unisex"]
  ORIGIN = ["french", "english", "hebrew", "latin"]
  ASTROLOGY = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
  POPULARITY = ["rare", "common", "popular"]
  validates :gender, inclusion: { in: GENDER }
  validates :origin, inclusion: { in: ORIGIN }
  validates :astrology, inclusion: { in: ASTROLOGY }
  validates :popularity, inclusion: { in: POPULARITY }
end
