class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]
  def show
  end

  def set_profile
    @profiles = User.where(id: current_user.id )
  end
end
