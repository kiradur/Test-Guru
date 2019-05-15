class User < ApplicationRecord

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  validates :email, uniqueness: true
  
  def show_tests_with_level(level_value)
    Test.joins("INNER JOIN passed_tests ON passed_tests.test_id = tests.id").where("passed_tests.user_id =  ?", self.id )
  end
end
