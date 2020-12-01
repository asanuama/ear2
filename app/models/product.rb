class Product < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :tags , through: :tag_maps
  has_many :tag_maps , dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  
  
  scope :pierce,-> { where(is_pierce: "true") }
  scope :nonhole_pierce,-> { where(is_pierce: "false") }
  scope :sold_one,-> { where(is_sold_one: "true") }
  scope :allergiefree, -> { where(is_allergiefree: "true")}
  scope :hidden, -> { where(is_hidden: "true") }
  scope :exposed, -> { where(is_hidden: "false") }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
    # articlesコントローラで配列化した値を引数で受け取ります
  def save_tags(tag_list)
      # 受け取った値を小文字に変換して、DBを検索して存在しない場合は
      # find_tag に nil が代入され　nil となるのでタグの作成が始まる
      unless find_tag = Tag.find_by(tag_name: tag_list)
        begin
          # create メソッドでタグの作成
          # create! としているのは、保存が成功しても失敗してもオブジェクト
          # を返してしまうため、例外を発生させたい
          self.tags.create!(tag_name: tag)
        # 例外が発生すると rescue 内の処理が走り nil となるので
        # 値は保存されないで次の処理に進む
        rescue
          nil
        end
      else
            # DB にタグが存在した場合、中間テーブルにブログ記事とタグを紐付けている
        ProductTagRelation.create!(product_id: self.id, tag_id: find_tag.id)
      end
    end
  
end
