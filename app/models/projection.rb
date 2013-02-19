class Projection
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :projection_date, :projection_time

  # Attributes
  field :projection_start, type: DateTime
  field :projection_date, type: String
  field :projection_time, type: String

  # Relationships
  belongs_to :theatre
  belongs_to :movie

  # Validations
  validates :projection_date, presence: true
  validates :projection_time, presence: true

  # Scopes
  scope :upcomming, lambda { where('projection_start <', Time.zone.now) }
end
