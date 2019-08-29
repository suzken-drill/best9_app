class Comment < ApplicationRecord
  belongs_to :team

  validates :name, presence: { message: I18n.t(:comment_name, scope: :message) }
  validates :comment, presence: { message: I18n.t(:comment_comment, scope: :message) }

end
