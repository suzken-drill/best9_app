class Member < ApplicationRecord
  belongs_to :team

  validates :order, presence: { message: I18n.t(:member_order) }
  validates :name, presence: { message: I18n.t(:member_name) }, length: { maximum: 255, too_long: I18n.t(:member_name_too_long) }
  validates :memo, length: { maximum: 255, too_long: I18n.t(:member_memo_too_long) }

end
