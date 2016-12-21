class Item < ApplicationRecord

  validates :desc, length: { minimum: 1, maximum: 100 }, presence: true
  validates :completed, presence: true

  belongs_to :list

  before_save { self.completed ||= false }

end
