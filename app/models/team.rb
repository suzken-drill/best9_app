class Team < ApplicationRecord
  has_many :comments
  has_many :members

  validates :name, presence: { message: I18n.t(:team_name) }, length: { maximum: 255, too_long: I18n.t(:team_name_too_long) }
  validates :author, presence: { message: I18n.t(:team_author) }, length: { maximum: 255, too_long: I18n.t(:team_author_too_long) }

end
