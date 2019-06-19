class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  has_one :rule, class_name: 'BadgeRuleService', dependent: :destroy

  validates :caption, presence: true
  validates :image, presence: true

  def self.images
    Dir.glob('app/assets/images/badges/*').map { |image| [File.basename(image), image.gsub('app/assets/images/', '')] }
  end

  def all_badge
    all_badge = []
    all_badge << badge 
  end
end
