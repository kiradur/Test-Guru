class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :tests_passages

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: :author_id, optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :timer_in_minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer_in_minutes, presence: true

  scope :easy, -> { select_by_level(0..1) }
  scope :medium, -> { select_by_level(2..4) }
  scope :hard, -> { select_by_level(5..Float::INFINITY) }

  scope :select_by_level, ->(level) { where(level: level) }

  scope :select_by_category, -> (category_title) {
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc) }

  def timer_in_minutes
    timer.zero? ? 0 : timer / 60
  end

  def timer_in_minutes=(value)
    self.timer = value.to_i * 60
  end    

  def self.select_by_category_title(category_title)
    Test.select_by_category(category_title).pluck(:title)
  end
end
