class ProductsController < ApplicationController
  before_action :authenticate_user!

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1
  def show
    @product = Product.find params[:id]
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    document = params[:product][:document]
    if @product.save
      if document
        @product.document.attach(document)
      end
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # GET /products/edit/1
  def edit
    @product = Product.find params[:id]
  end

  # PUT /products/1
  def update
    @product = Product.find params[:id]
    document = params[:product][:document]
    if @product.update(product_params)
      if document
        @product.document.attach(document)
      end
      redirect_to @product, notice: 'Product was successfully updated.'
    else
     render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit! # not liking it, need to die this
  end
end
