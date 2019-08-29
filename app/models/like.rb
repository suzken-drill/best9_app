class Like < ApplicationRecord
  belongs_to :team

  validates :session_key, presence: { message: I18n.t(:session_key_error, scope: :message) }

  def count_like
    where(team_id: team.id).count(:id)
  end
  def self.count_like(team)
    where(team_id: team.id).count(:id)
  end
end
