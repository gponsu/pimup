module UsersHelper
  def new_user
    @user ||= User.new
    @user.build_team
    @user
  end
end
