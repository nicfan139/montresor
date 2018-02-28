class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @products = Product.order(created_at: :desc)
  end
end
