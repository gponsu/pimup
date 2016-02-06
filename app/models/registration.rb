class Registration
  include ActiveModel::Model

  attr_accessor :user_email, :team_name
  validate :user_email_presence_uniqueness, :team_name_presence_uniqueness

  def save
    return false unless valid?
    team = Team.create(name: team_name)
    User.create(email: user_email, team: team)
  end

  private

  def user_email_presence_uniqueness
    if user_email.blank?
      errors.add(:user_email, :blank)
    elsif User.where(email: user_email).any?
      errors.add(:user_email, :taken)
    end
  end

  def team_name_presence_uniqueness
    if team_name.blank?
      errors.add(:team_name, :blank)
    elsif Team.where(name: team_name).any?
      errors.add(:team_name, :taken)
    end
  end
end
