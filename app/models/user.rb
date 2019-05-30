class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable, 
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  before_save :downcase_email

  validates :email, uniqueness: true 
  validates :email, format: /\w+[^\s]@\w+[^\s]\.\w+/i

  def select_by_level(level)
    tests.select_by_level(level)
  end

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  private
  
  def downcase_email
    self.email = email.strip.downcase
  end

end
