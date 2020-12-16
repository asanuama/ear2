class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
# 「bin/rails g active_admin:resource User」コマンドで生成。activeadminで、userを扱えるようにした