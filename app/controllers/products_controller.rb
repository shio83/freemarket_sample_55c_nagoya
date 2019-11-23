class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:exhibit, :confirm]
  before_action :validates_product, only: [:create]
  def exhibit
    @product = Product.new
    @product.images.build
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
     @category_parent_array << parent.name
    end

  end

   
  def json
  end

  def details
  end
 
  def create
    @product = Product.new(create_params)
    @product.save
  end
  
  def listingcompleted
  end

  def items
    @product = Product.new
    if @product.save
  
      image_params[:images].each do |image|
        #buildのタイミングは、newアクションでも可能かもしれません。buildすることで、saveした際にアソシエーション先のテーブルにも値を反映できるようになります。
        @product.images.build
        product_image = @product.images.new(url: image)
        product_image.save
      end
        #今回は、Ajaxのみの通信で実装するためHTMLへrespondする必要がないため、jsonのみです。
      respond_to do |format|
        format.json
      end
    end
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


  private
    def create_params
      
      params.require(:product).permit(
        :name, 
        :description,
        :size, 
        :brand, 
        :state, 
        :shipping_fee, 
        :shipping_region,
        :shipping_date, 
        :price,
        :category_id,
        images_attributes: {url: []}).merge(user_id: current_user.id)
       
        
    end


    def validates_product
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end

      @product = Product.new(
        name: params[:product][:name],
        description: params[:product][:description],
        size: params[:product][:size],
        brand: params[:product][:brand], 
        state: params[:product][:state], 
        shipping_fee: params[:product][:shipping_fee], 
        shipping_region: params[:product][:shipping_region],
        shipping_date: params[:product][:shipping_date], 
        price: params[:product][:price],
        category_id: params[:product][:category_id]
      )
      @product.images.build
      # binding.pry
      render '/products/exhibit' unless @product.valid?
    end 
    # def products_params
    #   params.require(:category).permit(:url, :name, :description)
    # end

    # # def create_params
    # #   # images以外の値についてのストロングパラメータの設定
    # #   item_params = params.require(:product).permit(:name, :description,:category_id, :size, :brand_id, :condition, :select_shipping_fee, :shipping_method, :area, :shipping_date, :price)
    # #   return item_params
    # # end

    # def image_params
    #   #imageのストロングパラメータの設定.js側でimagesをrequireすれば画像のみを引き出せるように設定する。
    #   params.require(:image).permit({:url => []})
    # end
   
end
