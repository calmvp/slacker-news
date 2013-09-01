class CreateTaggings < ActiveRecord::Migration
  def change
  	create_table :taggings do |t|
  	  t.references :tag
  	  t.references :post
  	end
  end
end
