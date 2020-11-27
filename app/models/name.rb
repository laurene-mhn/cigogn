class Name < ApplicationRecord
  validates :gender, presence: true
  validates :name, presence: true, uniqueness: true
  has_many :choices, dependent: :destroy
  GENDER = ["girl", "boy", "unisex"]
  ORIGIN = ["french", "english", "hebrew", "latin"]
  ASTROLOGY = [nil, "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
  POPULARITY = [nil, "rare", "common", "popular"]
  validates :gender, inclusion: { in: GENDER }
  validates :astrology, inclusion: { in: ASTROLOGY }
  validates :popularity, inclusion: { in: POPULARITY }
  # validates_intersection_of :astrology, in: ASTROLOGY, message: "invalid permission"
  # validates_intersection_of :astrology, within: ASTROLOGY, message: "invalid permission"
  # validates_intersection_of :popularity, in: POPULARITY, message: "invalid permission"
  # validates_intersection_of :popularity, within: POPULARITY, message: "invalid permission"
  validates_intersection_of :origin, in: ORIGIN, message: "invalid permission in IN"
  validates_intersection_of :origin, within: ORIGIN, message: "invalid permission in WITHIN"
end
