class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :body, :title, :user_id

  default_scope order: 'created_at DESC'

  attr_accessible :body, :title
end
