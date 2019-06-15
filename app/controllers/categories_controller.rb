class CategoriesController < ApplicationController
  before_action :authenticate_user!, :check_if_user_is_admin
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  # DELETE /categories/1
  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
