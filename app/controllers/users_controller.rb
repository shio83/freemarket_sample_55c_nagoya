class UsersController < ApplicationController
  def index
  end

  def profile
  end
  
  def  identification
    @user = Profile.new()
  end

  def logout 
  end

  def card
  end

  def exhibit
  end
end
