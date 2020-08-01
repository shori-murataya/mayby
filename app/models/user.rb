class User < ApplicationRecord
  validates :name, {presence: true}
  # 変なフォーマットも保存できてしまう。まずい
  # 独自システムよりもdevise gemに沿った方が良い
  validates :email, {presence: true, uniqueness: true}
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # アソシエーション
  def posts
    return Post.where(user_id:self.id)
  end

  def comments
    return Comment.where(user_id:self.id)
  end

end
