class UsersController < ApplicationController
  def index
    
  end

  def profile
  end
  
  def registration
    @user = User.new
    @user.build_address
  end

  def detail_tel
  end
  
  def detail_zip
    @user = User.new
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
    @user = User.new(user_params)
    @user.save
    # binding.pry
    render action: :detail_tel
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
