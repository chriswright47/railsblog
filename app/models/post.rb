class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :tags_attributes

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags


  def self.search(id)
    Rails.cache.fetch(id, :expires_in => 10.seconds) {Post.find(id)}
  end

  def self.all_posts
    Rails.cache.fetch('posts', :expires_in => 10.seconds) {Post.all}
  end

  def reset_cache
    Rails.cache.clear
  end


  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
