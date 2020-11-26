class Filter < ApplicationRecord
  belongs_to :user
  GENDER = ["girl", "boy", "unisex"]
  ORIGIN = ["french", "english", "hebrew", "latin"]
  ASTROLOGY = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
  LENGTH = ["short 0-5ch", "medium 6-9ch", "long 10ch & more"]
  POPULARITY = ["rare", "common", "popular"]
  validates :gender, inclusion: { in: GENDER }
  # validates :origin, inclusion: { in: ORIGIN }
  # validates :astrology, inclusion: { in: ASTROLOGY }
  # validates :length, inclusion: { in: LENGTH }
  validates :popularity, inclusion: { in: POPULARITY }
  validates_intersection_of :origin, in: ORIGIN, message: "invalid permission"
  validates_intersection_of :origin, within: ORIGIN, message: "invalid permission"
  validates_intersection_of :astrology, in: ASTROLOGY, message: "invalid permission"
  validates_intersection_of :astrology, within: ASTROLOGY, message: "invalid permission"
  validates_intersection_of :length, in: LENGTH, message: "invalid permission"
  validates_intersection_of :length, within: LENGTH, message: "invalid permission"
  validates_intersection_of :popularity, in: POPULARITY, message: "invalid permission"
  validates_intersection_of :popularity, within: POPULARITY, message: "invalid permission"
end
