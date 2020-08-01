class Comment < ApplicationRecord
  # belongs_to :user
  # belongs_to :post
  MXIMUM_LENGTH_CONTENT = 140
  PER_PAGE = 5

  validates :content, { presence: true, length: { maximum: MXIMUM_LENGTH_CONTENT } }

  belongs_to :user
  belongs_to :post

  # default_scopeはできるだけ使わない
  # TODO: https://techracho.bpsinc.jp/hachi8833/2017_10_31/47302
  # TODO: https://blog.piyo.tech/posts/2018-09-03-must-be-ordered-gem/
  default_scope -> { order(created_at: :desc) }
  paginates_per PER_PAGE

  # https://railsguides.jp/association_basics.html
  def comuser # @comment.user
    User.find_by(id: self.user_id)
  end

  def compost # @comment.post
    Post.find_by(id: self.post_id)
  end
end
