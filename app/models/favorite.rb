class Favorite < ApplicationRecord
  belongs_to :user
	belongs_to :product
	
	scope :only_exposed, -> {joins(:product).merge(Product.exposed)}
end
