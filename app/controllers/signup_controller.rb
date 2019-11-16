class SignupController < ApplicationController
  def registration
    @user = User.new
    @user.build_address
  end

  def detail_tel
    session[:user_params] = user_params 
    session[:address_attributes_after_registration] = user_params[:address_attributes] 
    @user = User.new
    @user.build_address
  end

  def detail_zip
    session[:address_attributes_after_detail_tel] = user_params[:address_attributes] 
    session[:address_attributes_after_detail_tel].merge!(session[:address_attributes_after_registration])
    @user = User.new
    @user.build_address
  end

  def detail_payment
    session[:address_attributes_after_detail_zip] = user_params[:address_attributes]  
    session[:address_attributes_after_detail_zip].merge!(session[:address_attributes_after_detail_tel])  
    @user = User.new
    @user.build_address
    
  end

  def create
    @user = User.new(session[:user_params])
    session[:address_attributes_after_detail_payment] = user_params[:address_attributes]
    session[:address_attributes_after_detail_payment].merge!(session[:address_attributes_after_detail_zip])
    @user.build_address(session[:address_attributes_after_detail_payment])
    @user.address.save
    if @user.save
      session[:id] = @user.id
      redirect_to detail_done_signup_index_path
    else
      render '/signup/registration'
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email, 
      :password, 
      address_attributes:[
        :id,
        :last_name,
        :first_name, 
        :last_name_kana, 
        :first_name_kana, 
        :birth_year, 
        :birth_month, 
        :birth_day, 
        :phone_number,
        :zipcode,
        :prefecture,
        :city,
        :address,
        :building,
        :authorization_token,
        :security_code,
        :expiration_date_month,
        :expiration_date_year
      ]
    )
  end
end

def create
  
end
