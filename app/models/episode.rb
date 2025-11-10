class Episode < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :season, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :episode, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :season, uniqueness: { scope: :episode }

  # Serialization for array fields
  serialize :characters, type: Array, coder: JSON

  # Scopes
  scope :by_season, ->(season) { where(season: season).order(:episode) }
  scope :ordered, -> { order(:season, :episode) }
end
