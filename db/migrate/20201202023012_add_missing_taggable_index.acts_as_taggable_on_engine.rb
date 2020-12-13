# This migration comes from acts_as_taggable_on_engine (originally 4)
if ActiveRecord.gem_version >= Gem::Version.new('5.0')
  class AddMissingTaggableIndex < ActiveRecord::Migration[4.2]; end
else
  class AddMissingTaggableIndex < ActiveRecord::Migration; end
end

# デプロイの際にエラーが出る事象が発生したため、下記サイトを参考に下記メソッドをコメントアウト
# https://qiita.com/matsubishi5/items/726b2f2f1b6655516b9d
AddMissingTaggableIndex.class_eval do
  def self.up
   # add_index ActsAsTaggableOn.taggings_table, [:taggable_id, :taggable_type, :context], name: 'taggings_taggable_context_idx'
  end

  def self.down
   # remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_taggable_context_idx'
  end
end
