class UsersController < ApplicationController
 
  
  def index
    @nickname = current_user.nickname
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
    @product = Product.where(seller_id: current_user.id).order("created_at DESC")
    @product.each do |product|
      @image = product.images[0].url.url
    end
  end

  def sell_now
    @product = Product.where(seller_id: current_user.id).order("created_at DESC")
    @product.each do |product|
      @image = product.images[0].url.url
    end

  end

  def sell_was
    @product = Product.where(seller_id: current_user.id).order("created_at DESC")
    @product.each do |product|
      @image = product.images[0].url.url
    end
  end

  def purchase
    @product = Product.where(buyer_id: current_user.id).order("created_at DESC")
    @product.each do |product|
      @image = product.images[0].url.url
    end
  end

  def purchased
    @product = Product.where(seller_id: current_user.id).order("created_at DESC")
    @product.each do |product|
      @image = product.images[0].url.url
    end
  end

 

  def create
    @user = User.new(user_params)
    @user.save
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
