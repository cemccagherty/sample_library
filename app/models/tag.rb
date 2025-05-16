class Tag < ApplicationRecord
  has_many :sample_tags, dependant: :destroy
  has_many :samples, through: :sample_tags

  validates :name, presence: true
  validates :name, uniqueness: true
  # uniqueness validation included alongside dadatabase index uniqueness for user-friendly error message
  validates :name, length: { in: 1..20 }
end
