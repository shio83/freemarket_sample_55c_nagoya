class UsersController < ApplicationController
 
  
  def index
    
  end

  def profile
  end
  
  def logout 
    @user = User.new
  end

  def card
  end

  def exhibit
  end

  def notification
  end

  def todo
  end

  def sell_will
  end

  def sell_now
  end

  def sell_was
  end

  def purchase
  end

  def purchased
  end

  def create
    @user = User.new(user_params)
    @user.save
    render action: :detail_tel
  end

  def sell_detail
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email, 
      :password, 
      address_attributes:[:id, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day]
    )
  end
end
