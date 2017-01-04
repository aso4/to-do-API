class Item < ApplicationRecord

  validates :desc, length: { minimum: 1, maximum: 100 }, presence: true
  validates :completed, inclusion: { in: [true, false] }
  #validates_inclusion_of :completed, :in => [true, false]

  belongs_to :list

  before_save { self.completed ||= false }

end
