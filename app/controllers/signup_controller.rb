class SignupController < ApplicationController
  def registration
    @user = User.new
    @user.build_address
  end

  def detail_tel
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    # session[:user_params] = user_params  #userモデルの値をぶっこむ。
    # session[:address_attributes_after_registration] = user_params[:address_attributes]  # addressモデルの値をぶっこむ。
    @user = User.new
    @user.build_address
  end

  def detail_zip
    session[:phone_number] = user_params[:phone_number]
    # session[:address_attributes_after_detail_tel] = user_params[:address_attributes]  # detail_telで入力された情報をsessionにぶっこむ。
    # session[:address_attributes_after_detail_tel].merge!(session[:address_attributes_after_registration])  # detail_telのsessionにregistrationのsessionの中身を合わせる。
    @user = User.new
    # @user.build_address
  end

  def detail_payment
    session[:zipcode] = user_params[:zipcode]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:building] = user_params[:building]
    # session[:address_attributes_after_detail_zip] = user_params[:address_attributes]  # detail_zipで入力された情報をsessionにぶっこむ。
    # session[:address_attributes_after_detail_zip].merge!(session[:address_attributes_after_detail_tel])  # detail_telのsessionにdetail_telのsessionの中身を合わせる。
    @user = User.new
    # @user.build_address
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day:session[:birth_day],
      phone_number: session[:phone_number],
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building]
    )
    # @user = User.new(session[:user_params])
    # @user.build_address(session[:address_attributes_after_detail_zip])
    # @user.build_address(user_params[:address_attributes])
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
