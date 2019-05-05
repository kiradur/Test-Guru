class User < ApplicationRecord
  def tests_by(level)
    tests.where(level: level)
  end
end
