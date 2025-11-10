class Death < ApplicationRecord
  # Validations
  validates :death, presence: true
  validates :cause, presence: true

  # Scopes
  scope :by_season, ->(season) { where(season: season) }
  scope :by_responsible, ->(responsible) { where(responsible: responsible) }
end
