class OffersController < ApplicationController

  before_action :find_offer, only: [ :edit, :update, :destroy, :accept, :decline ]
  before_action :find_product, only: [ :create, :update, :edit, :destroy ]

  def create
    @offer = current_user.offers.build(offer_params)
    @offer.product = @product
    authorize @offer
    @offer.save

    redirect_to product_path(@product)
  end

  def edit
    authorize @offer
  end

  def update
    authorize @offer
    @offer.update(offer_params)

    redirect_to product_path(@product)
  end

  def destroy
    authorize @offer
    @offer.destroy

    redirect_to product_path(@product)
  end

  def accept
    @offer.state = "accepted"
    authorize @offer
    @offer.save
    redirect_to user_path(current_user)
  end

  def decline
    @offer.state = "declined"
    authorize @offer
    @offer.save

    redirect_to user_path(current_user)
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :price)
  end

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
