class TopsController < ApplicationController
  
  def index
    @product = Product.order("created_at desc").limit(10)
  end

  def json
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end
  
 
end
