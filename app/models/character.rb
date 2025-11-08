class Character < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :status, inclusion: { in: ['Alive', 'Deceased', 'Presumed dead', 'Unknown'] }, allow_nil: true

  # Serialization for array fields
  serialize :occupation, type: Array, coder: JSON
  serialize :appearance, type: Array, coder: JSON

  # Scopes
  scope :alive, -> { where(status: 'Alive') }
  scope :deceased, -> { where(status: 'Deceased') }
  scope :by_category, ->(category) { where(category: category) }
end
