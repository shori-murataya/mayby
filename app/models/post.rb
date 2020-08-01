class Post < ApplicationRecord
  # {}の間スペース一つ
  validates :name, {presence: true}
  # 300を定数にする
  validates :howto, {presence: true, length: {maximum:300}}
  # アソシエーションの定義
  validates :user_id, {presence: true}
  validates :count, {presence: true}
  validates :difficulty, {presence: true}

  belongs_to :user
  has_many :comments, dependent: :destroy

  # やめる。must_be_ordered gemを入れる
  default_scope -> {order(created_at: :desc)}


  # アソシエーション
  def user
    return User.find_by(id: self.user_id)
  end

  def comments
    return Comment.where(post_id: self.id)
  end

end
