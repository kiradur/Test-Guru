class BadgeRule < ApplicationRecord

  belongs_to :badge
  belongs_to :category, optional: true
  belongs_to :test, optional: true

  scope :by_test, ->(test) { where(rule_type: 'test', test: [test, nil]) }
  scope :by_category, ->(category) { where(rule_type: 'category', category: [category, nil]) }
  scope :by_level, ->(level, category) { where(rule_type: 'level', level: level, category: [category, nil]) }
  
end
