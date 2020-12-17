class Product < ApplicationRecord
  attachment :image
  acts_as_taggable
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :product_comments, dependent: :destroy
	
  validates :name, presence: true,length: { in: 1..20 } 
  validates :explanation, presence: true ,length: { in: 2..300 } 
  validates :price, presence: true ,length: { in: 1..6 } ,numericality: true
  validates :image, presence: true
  
  scope :pierce,-> { where(is_pierce: "true") }
  scope :nonhole_pierce,-> { where(is_pierce: "false") }
  scope :sold_one,-> { where(is_sold_one: "true") }
  scope :allergiefree, -> { where(is_allergiefree: "true")}
  scope :hidden, -> { where(is_hidden: "true") }
  scope :exposed, -> { where(is_hidden: "false") }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
