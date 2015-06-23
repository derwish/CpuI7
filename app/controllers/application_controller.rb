class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def update_view_counter
    if session[:counter].nil?
      reset_view_counter
    else
      session[:counter] += 1
    end
  end

  def reset_view_counter
    session[:counter] = 0
  end
  
  def update_visited_msg
    if (session[:counter] > 4)
      @visited_msg = "Visited: #{session[:counter]} times"
    end
  end
  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
end
