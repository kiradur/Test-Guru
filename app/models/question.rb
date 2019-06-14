class Question < ApplicationRecord

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  scope :active, -> { joins(:answers).distinct }

  validates :body, presence: true

end
