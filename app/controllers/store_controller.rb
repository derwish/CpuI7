class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart

    update_view_counter
    update_visited_msg
  end
end
