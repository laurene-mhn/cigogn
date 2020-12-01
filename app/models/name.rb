class Name < ApplicationRecord
  validates :gender, presence: true
  validates :name, presence: true, uniqueness: true
  has_many :choices, dependent: :destroy

  GENDER = ["Peu importe", "garçon", "fille"]
  POPULARITY = ["rare", "peu fréquent", "fréquent", "très fréquent"]
  ORIGIN = ["Africain", "Allemand", "Américain", "Anglais", "Arabe", "Arménien", "Australien", "Basque", "Breton", "Celte", "Chinois", "Corse", "Ecossais", "Egyptien", "Espagnol", "Français", "Grec", "Hébraïque", "Indien", "Irlandais", "Italien", "Japonais", "Latin", "Marocain", "Polonais", "Portugais", "Provençal", "Roumain", "Russe", "Scandinave", "Slave", "Suédois", "Turc"]
  ASTROLOGY = ["Bélier", "Taureau", "Gémeau", "Cancer", "Lion", "Vierge", "Balance", "Scorpion", "Sagittaire", "Capricorne", "Verseau", "Poisson"]

  validates :gender, inclusion: { in: GENDER }, allow_blank: true
  validates :astrology, inclusion: { in: ASTROLOGY }, allow_blank: true
  validates :popularity, inclusion: { in: POPULARITY }, allow_blank: true
  # validates_intersection_of :astrology, in: ASTROLOGY, message: "invalid permission"
  # validates_intersection_of :astrology, within: ASTROLOGY, message: "invalid permission"
  # validates_intersection_of :popularity, in: POPULARITY, message: "invalid permission"
  # validates_intersection_of :popularity, within: POPULARITY, message: "invalid permission"
  validates_intersection_of :origin, in: ORIGIN, message: "invalid permission in IN"
  validates_intersection_of :origin, within: ORIGIN, message: "invalid permission in WITHIN"
end

  # GENDER = ["girl", "boy", "unisex"]
  # ORIGIN = ["french", "english", "hebrew", "latin"]
  # ASTROLOGY = [nil, "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"]
  # POPULARITY = [nil, "rare", "common", "popular"]
