class Location < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Scopes
  scope :by_city, ->(city) { where(city: city) }
  scope :by_state, ->(state) { where(state: state) }
end
