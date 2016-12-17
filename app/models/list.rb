class List < ApplicationRecord

  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

end
