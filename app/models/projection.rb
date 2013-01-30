class Projection
  include Mongoid::Document
  attr_accessible :projection_start

  # Attributes
  field :projection_start, type: DateTime

  # Relationships
  belongs_to :theatre
  belongs_to :movie

  # Validations
  validates :projection_start, presence: true
end
