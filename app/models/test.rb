class Test < ApplicationRecord
  belongs_to :category
  has_many   :questions
  has_many   :passed_tests
  has_many   :users, through: :passed_tests

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (name_category) { joins(:category).
                                           where(categories: { title: name_category }) }
  def self.all_by_category(category)
     Test.joins("JOIN categories ON categories.id = tests.category_id").where("categories.title = ?", category ).order(title: :desc).pluck(:title)
  end
end
