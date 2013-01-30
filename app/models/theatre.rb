class Theatre
  include Mongoid::Document
  attr_accessible :seats_count

  # Attributes
  field :seats_count, type: Integer

  # Relationships
  has_many :movies, through: :projections

  # Validations
  validates :seats_count, numericality: { only_integer: true }, presence: true
end
