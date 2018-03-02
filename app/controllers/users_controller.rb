class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @products = @user.products.order(created_at: :desc)
    @is_current_user = @user == current_user

    # SELL / offers displaying
    @pending_offers = Offer.where(product: @user.products, state: "pending")
    @accepted_offers = Offer.where(product: @user.products, state: "accepted")
    @declined_offers = Offer.where(product: @user.products, state: "declined")
    @offers = [@pending_offers, @accepted_offers, @declined_offers]

    # rates
    @sales = @accepted_offers.length
    @acceptance_rate = @sales / (@accepted_offers.length + @sales).to_f
  end
end
