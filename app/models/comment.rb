class Comment < ActiveRecord::Base
  attr_accessible :commenter
  belongs_to :post
  attr_accessible :body, :comment
end
