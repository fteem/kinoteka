class Genre
  include Mongoid::Document
  include Mongoid::Timestamps

  # Attributes
  field :name, type: String

  # Relationships
  has_and_belongs_to_many :movies

  # Validations
  validates :name, presence: true
end
