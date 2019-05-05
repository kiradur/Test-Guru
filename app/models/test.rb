class Test < ApplicationRecord
  def self.all_by_category(category)
    by_category(category).pluck(:title)
  end
end
