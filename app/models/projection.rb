class Projection
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :projection_start

  # Attributes
  field :projection_start, type: DateTime

  # Relationships
  belongs_to :theatre
  belongs_to :movie

  # Validations
  validates :projection_start, presence: true

  # Scopes
  scope :upcomming, lambda { where('projection_start <', Time.zone.now) }
end
