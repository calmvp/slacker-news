class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings 

  attr_writer :tags
  attr_accessible :tags, :title, :body
  
  validates_uniqueness_of :title

  # after_save :set_tags

  # def tags
  #   @tags || tags.map(&:name).join(' ')
  # end

#   private

#   def set_tags
#     if @tags
#       self.tags = @tag_names.split(' ').map do |name|
#         Tag.find_or_create_by_name(name: name)
#       end
#     end
#   end
end
