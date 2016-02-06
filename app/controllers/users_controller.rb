class UsersController < ApplicationController
  def create
    # TODO: Move registration to its own controller
    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to page_path('registered')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, team_attributes: [:name])
  end

  def registration_params
    params.require(:registration).permit(:user_email, :team_name)
  end
end
