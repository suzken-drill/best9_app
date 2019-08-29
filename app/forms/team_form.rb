class TeamForm
  include ActiveModel::Model

  attr_accessor  :team_name, :team_author, :team_discription, :member_orders, :member_names, :member_memos

  #constant
  TEAM_MEMBER_NUM = 9

  def initialize(*args)
  	self.member_orders = (1..9).to_a
  	self.member_names = Array.new(9)
  	self.member_memos = Array.new(9)
    super
  end

  validates :team_name, presence: {message: I18n.t(:team_name)}
  validates :team_author, presence: {message: I18n.t(:team_author)}
  validate :member_name_presence?

  def member_name_presence?
    self.member_names.each_with_index do |value, i|
      errors.add(:member_names, I18n.t(:member_name, order: i + 1)) if value.blank?
    end
  end

end