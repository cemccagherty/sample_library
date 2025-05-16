class Sample < ApplicationRecord
  belongs_to :user
  has_one_attached :audio_file

  has_many :sample_tags, dependant: :destory
  has_many :tags, through: :sample_tags

  ACCEPTED_KEYS = [
    'C', 'C#/Db', 'D', 'D#/Eb', 'E',
    'F', 'F#/Gb', 'G', 'G#/Ab', 'A',
    'A#/Bb', 'B', 'N/A'
  ].freeze

  validates :name, presence: true
  validates :name, length: { in: 1..30 }

  validates :bpm, inclusion: { in: 20..300 }, allow_nil: true
  # allow_nil: true to accomodate N/A bpm input for ambient etc

  validates :key, inclusion: { in: ACCEPTED_KEYS }

  validates :source, length: { in: 1..150 }

  validates :private, presence: true

  validates :audio_file, attached: true
  validates :audio_file, content_type: [
    'audio/mpeg',
    'audio/x-aiff',
    'audio/vnd.wave',
    'audio/x-wav',
    'audio/x-flac'
  ]
  # audio/x-wav included for compatability with legacy WAV identifying format.
  validates :audio_file, duration: { less_than_or_equal_to: 5.minutes }
  validates :audio_file, size: { less_than: 50.megabytes }
  # large audio_file size to accomodate wav uploads.
end
