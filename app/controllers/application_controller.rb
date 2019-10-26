class ApplicationController < ActionController::Base
  before_action :set_parents

  protect_from_forgery with: :exception

  private
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
