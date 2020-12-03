class Filter < ApplicationRecord
  belongs_to :user
  GENDER = Name::GENDER
  ORIGIN = Name::ORIGIN
  ASTROLOGY = Name::ASTROLOGY
  LENGTH = ["Court", "Moyen", "Long"]
  POPULARITY = Name::POPULARITY
  # validates :gender, inclusion: { in: GENDER }
  # validates :origin, inclusion: { in: ORIGIN }
  # validates :astrology, inclusion: { in: ASTROLOGY }
  # validates :length, inclusion: { in: LENGTH }
  # validates :popularity, inclusion: { in: POPULARITY }
  validates_intersection_of :origin, in: ORIGIN, message: "invalid permission"
  validates_intersection_of :origin, within: ORIGIN, message: "invalid permission"
  validates_intersection_of :astrology, in: ASTROLOGY, message: "invalid permission"
  validates_intersection_of :astrology, within: ASTROLOGY, message: "invalid permission"
  validates_intersection_of :length, in: LENGTH, message: "invalid permission"
  validates_intersection_of :length, within: LENGTH, message: "invalid permission"
  validates_intersection_of :popularity, in: POPULARITY, message: "invalid permission"
  validates_intersection_of :popularity, within: POPULARITY, message: "invalid permission"
end


