class Quote < ApplicationRecord
  # Validations
  validates :quote, presence: true
  validates :author, presence: true

  # Scopes
  scope :by_author, ->(author) { where(author: author) }
  scope :random, -> { order("RANDOM()").limit(1) }
end
