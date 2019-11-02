class ProductsController < ApplicationController

  def exhibit
    @product = Product.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
     @category_parent_array << parent.name
    end
  end

  def json
  end

  def details
  end
  

  def new
   @category_parent_array = ["---"]
   Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
   end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    selected_grandchild = Category.find("#{params[:grandchild_id]}") 
    if selected_grandchild.sizes[0] 
       related_size_parent = selected_grandchild.sizes[0] 
       @sizes = related_size_parent.children
    else
       selected_child = Category.find("#{params[:grandchild_id]}").parent 
       if related_size_parent = selected_child.sizes[0] 
          @sizes = related_size_parent.children 
       end
    end
 end

  def create
    @product = Product.new
    @product.save
  end

  private
    def products_params
      params.require(:category).permit(:url, :name, :description)
    end


end
