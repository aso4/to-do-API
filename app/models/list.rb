class List < ApplicationRecord

  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :permissions, presence: true

  before_save { self.permissions ||= :hidden }

  enum permissions: [:hidden, :viewable, :open]
end
