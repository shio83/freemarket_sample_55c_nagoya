class TopsController < ApplicationController
  
  def index
    @product = Product.order("created_at desc").limit(10)

    @lady_
    @lady_product = @product.where(id: 1)
  end

  def json
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

 
end
