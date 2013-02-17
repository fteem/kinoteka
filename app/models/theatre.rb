class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :name_eng, :name_cyr, :seats_count

  # Attributes
  field :_id,         type: String, default: ->{ name_eng.to_s.parameterize }
  field :seats_count, type: Integer
  field :name_eng,    type: String
  field :name_cyr,    type: String

  # Relationships
  has_many :projections

  # Validations
  validates :seats_count, numericality: { only_integer: true }, presence: true
  validates :name_eng, presence: true
  validates :name_cyr, presence: true
  validates :seats_count, presence: true
end
