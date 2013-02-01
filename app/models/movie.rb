class Movie
  include Mongoid::Document
  include Mongoid::Timestamps
  attr_accessible :name, :year, :plot, :director, :length_minutes

  VALID_RATINGS = ['Unrated', 'G', 'PG', 'PG-13', 'R', 'NC-17']

  # Attributes
  field :_id,            type: String, default: ->{ name.to_s.parameterize }
  field :name,           type: String
  field :year,           type: Integer
  field :plot,           type: String
  field :director,       type: String
  field :length_minutes, type: Integer

  # Relationships
  has_many :projections
  has_and_belongs_to_many :genres

  # Validations
  validates :name, presence: true, length: { within: 5..256 }
  validates :year, presence: true, numericality: { only_integer: true }
  validates :length_minutes, presence: true
  validate  :movie_length

  def movie_length
    if length_minutes && length_minutes <= 0
      errors.add 'length_minutes', 'must be greater then zero'
    end
  end
end
