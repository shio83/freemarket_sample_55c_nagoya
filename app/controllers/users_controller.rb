class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :profilex]
  
  def index
    
  end

  def profile
  end
  
  def registration
    @user = User.new
  end

  def detail_tel
  end
  
  def detail_zip
    @user = User.new
  end
  
  def detail_payment
  end
  
  def detail_done
  end

  
  def logout 
  end

  def card
  end

  def exhibit
  end

  def notification
  end

  def todo
  end

  def purchase
  end

  def purchased
  end

  def create
  end

end
