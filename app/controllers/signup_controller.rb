class SignupController < ApplicationController

  before_action :validates_step1, only: :detail_tel
  before_action :validates_step2, only: :detail_zip
  before_action :validates_step3, only: :detail_payment
  before_action :validates_step4, only: :detail_done

  protect_from_forgery :except => [:create]

  def registration
    @user = User.new
    
  end
  
  def detail_tel
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana] 
    session[:birth_year] = user_params[:birth_year]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day] 
    @user = User.new 
  end

  def detail_zip
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def detail_payment
    session[:zipcode] = user_params[:zipcode]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    @user = User.new
  end

  def detail_done 
    session[:authorization_token] = user_params[:authorization_token]
    session[:security_code] = user_params[:security_code]
    session[:expiration_date_month] = user_params[:expiration_date_month]
    session[ :expiration_date_year] = user_params[:expiration_date_year]
    @user = User.new
  end

  

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building],
      authorization_token: session[:authorization_token],
      security_code: session[:security_code],
      expiration_date_month: session[:expiration_date_month],
      expiration_date_year: session[:expiration_date_year]
    )
   
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to  root_path
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
      :password_confirmation, 
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
    )
  end

  def validates_step1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana] 
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name]
    )
   
    render '/signup/registration' unless @user.valid?(:validates_step1)
  end


  def validates_step2
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      phone_number: session[:phone_number]
    )
  
    render '/signup/detail_tel' unless @user.valid?(:validates_step2)
  end

  def validates_step3
    session[:zipcode] = user_params[:zipcode]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      phone_number: session[:phone_number],
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building]
    )
    render '/signup/detail_zip' unless @user.valid?(:validates_step3)
  end

  def validates_step4
    session[:authorization_token] = user_params[:authorization_token]
    session[:security_code] = user_params[:security_code]
    session[:expiration_date_month] = user_params[:expiration_date_month]
    session[ :expiration_date_year] = user_params[:expiration_date_year]
    @user= User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana],
      last_name: session[:last_name],
      phone_number: session[:phone_number],
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building],
      authorization_token: session[:authorization_token],
      security_code: session[:security_code],
      expiration_date_month: session[:expiration_date_month],
      expiration_date_year: session[:expiration_date_year]
    )
    
    render '/signup/detail_payment' unless @user.valid?(:validates_step4)
  end
 


 

end


