class Comment < ApplicationRecord
  belongs_to :team

  validates :name, presence: { message: I18n.t(:comment_name) }
  validates :comment, presence: { message: I18n.t(:comment_comment) }

end
