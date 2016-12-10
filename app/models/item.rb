class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :desc, length: { minimum: 1, maximum: 100 }, presence: true
  validates :user, presence: true
  validates :list, presence: true

end
