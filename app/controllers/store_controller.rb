class StoreController < ApplicationController
  def index
    @products = Product.all
    update_view_counter
    update_visited_msg
  end
end
