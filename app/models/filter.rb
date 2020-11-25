class Filter < ApplicationRecord
  belongs_to :user
  GENDER = ["girl", "boy", "unisex"]
  # ORIGIN = ["french", "english", "hebrew", "latin"]
  ASTROLOGY = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
  LENGTH = ["short 0-5ch", "medium 6-9ch", "long 10ch & more"]
  POPULARITY = ["rare", "common", "popular"]
  validates :gender, inclusion: { in: GENDER }
  # validates :origin, inclusion: { in: ORIGIN }
  validates :astrology, inclusion: { in: ASTROLOGY }
  validates :length, inclusion: { in: LENGTH }
  validates :popularity, inclusion: { in: POPULARITY }
end
