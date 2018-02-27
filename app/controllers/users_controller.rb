class UsersController < ApplicationController
  def show
    authorize current_user
    @pending_offers = Offer.where(product: current_user.products, state: "pending")
    @accepted_offers = Offer.where(product: current_user.products, state: "accepted")
    @declined_offers = Offer.where(product: current_user.products, state: "declined")
    @offers = [@pending_offers, @accepted_offers, @declined_offers]
  end
end
