class Like < ApplicationRecord
  # アソシエーションを定義をしっかりすれば以下のコードはなくなる
  validates :user_id, { presence: true }
  validates :post_id, { presence: true }

  belongs_to :user
  # blongs_to :post

  # @like.user
  def likeusers
    return User.find_by(id: self.user_id)
  end

  # @like.post
  def likeposts
    return Post.find_by(id: self.post_id)
  end
end
