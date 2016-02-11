class RegistrationsController < ApplicationController
  def create
    @registration = Registration.new(registration_params)
    @registration.save

    respond_to do |format|
      format.js
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:user_email, :team_name)
  end
end
