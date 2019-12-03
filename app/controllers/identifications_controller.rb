class IdentificationsController < ApplicationController
  def index
    @user = Profile.new()
  end

  def create
    @user = Profile.new(profile_params)
    @user.save
  end

  private
  def profile_params
    params.require(:profile).permit(:zipcode, :prefecture, :city , :address, :building).merge(seller_id: current_user.id)
  end
end
