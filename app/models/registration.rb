class Registration
  include ActiveModel::Model

  attr_accessor :user_email, :team_name

  validate :team_name_uniqueness, :user_email_uniqueness
  validates :team_name, presence: true, length: { maximum: 20 }
  validates :user_email, presence: true

  def save
    return false unless valid?
    team = Team.create(name: team_name)
    User.create(email: user_email, team: team)
  end

  private

  def user_email_uniqueness
    errors.add(:user_email, :taken) if User.where(email: user_email).any?
  end

  def team_name_uniqueness
    errors.add(:team_name, :taken) if Team.where(name: team_name).any?
  end
end
