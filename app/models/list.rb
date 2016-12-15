class List < ApplicationRecord

  has_many :items, dependent: :destroy

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

end
