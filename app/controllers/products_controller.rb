class ProductsController < ApplicationController

  before_action :find_product, only: [ :edit, :update, :destroy, :show ]

  def show
    authorize @product
  end

  def new
    @product = current_user.products.build
    authorize @product
  end

  def create
    @product = current_user.products.build(restaurant_params)
    authorize @product
    @product.save

    redirect_to root_path
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    @product.update(restaurant_params)

    redirect_to root_path
  end

  def destroy
    authorize @product
    @product.destroy

    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:product).permit(:description, :name, :price, :category, :photo)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
