class TopsController < ApplicationController
  def index
  end

  def json
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

 
end
