class Team < ApplicationRecord
  has_many :comments
  has_many :members
  has_many :likes

  validates :name, presence: { message: I18n.t(:team_name, scope: :message) }, length: { maximum: 255, too_long: I18n.t(:team_name_too_long, scope: :message) }
  validates :author, presence: { message: I18n.t(:team_author, scope: :message) }, length: { maximum: 255, too_long: I18n.t(:team_author_too_long, scope: :message) }

  def already_liked?(session_key)
	Like.where(team_id: self.id, session_key: session_key).count > 0
  end
end
