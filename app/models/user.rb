class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_pasages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def select_by_level(level)
    tests.select_by_level(level)
  end

  def test_pasage(test)
    test_pasages.order(id: :desc).find_by(test: test)
  end

end
