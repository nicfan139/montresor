class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :find_product, only: [ :edit, :update, :destroy, :show ]

  def show
    authorize @product
  end

  def new
    @product = current_user.products.build
    authorize @product
  end

  def create
    @product = current_user.products.build(product_params)
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to(root_path, notice: 'Registration received.') }
      else
        format.html { redirect_to(root_path, alert: 'Sorry! There was a problem with your product creation. Please contact us to sort it out.') }
      end
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)

    redirect_to root_path
  end

  def destroy
    authorize @product
    @product.destroy

    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:description, :name, :price, :category, :photo)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
