class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments

  def comments_for_post(post)
    comments = []
    self.comments.each do |comment|
      if comment.post == post
        comments << comment
      end
    end
    comments
  end
end
