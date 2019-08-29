class Member < ApplicationRecord
  belongs_to :team

  validates :order, presence: { message: I18n.t(:member_order, scope: :message) }
  validates :name, presence: { message: I18n.t(:member_name, scope: :message) }, length: { maximum: 255, too_long: I18n.t(:member_name_too_long, scope: :message) }
  validates :memo, length: { maximum: 255, too_long: I18n.t(:member_memo_too_long, scope: :message) }

end
