class UsersController < ApplicationController
  def index
  end

  def profile
  end
  
  def  identification
    @user = User.new
  end

  def logout 
  end

  def card
  end

  def exhibit
  end
end
