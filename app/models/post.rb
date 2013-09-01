class Post < ActiveRecord::Base
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings 

  attr_accessor :tag_names
  attr_accessible :tag_names, :title, :body
  
  validates_uniqueness_of :title

  after_save :set_tags

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end

  private

  def set_tags
    if @tag_names
      self.tags = @tag_names.split(' ').map do |name|
        Tag.find_or_create_by_name(name: name)
      end
    end
  end
end
