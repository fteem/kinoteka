class Genre
  include Mongoid::Document
  include Mongoid::Timestamps

  # Attributes
  field :_id,      type: String, default: ->{ name_eng.to_s.parameterize }
  field :name_cyr, type: String
  field :name_eng, type: String

  # Relationships
  has_and_belongs_to_many :movies

  # Validations
  validates :name_cyr, presence: true
  validates :name_eng, presence: true
end
