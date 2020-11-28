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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  
end
