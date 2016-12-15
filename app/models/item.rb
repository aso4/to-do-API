class Item < ApplicationRecord

  validates :desc, length: { minimum: 1, maximum: 100 }, presence: true

end
