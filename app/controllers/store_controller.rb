class StoreController < ApplicationController
  def index
    set_counter
    if session[:counter] > 5
      @counter = "You have visited this page %s" % view_context.pluralize(session[:counter], "time")
    end
    @products = Product.order(:title)
  end

  private
    def set_counter
      if session[:counter].nil?
        session[:counter] = 1
      else
        session[:counter] += 1
      end
    end
end
