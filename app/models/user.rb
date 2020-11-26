class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
         
  scope :viewer, -> { where(is_designer: "false") }
  scope :designer, -> { where(is_designer: "true") }
  
  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy

end
