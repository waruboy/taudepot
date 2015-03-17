class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      set_counter
      if session[:counter] > 5
        @counter = "You have visited this page %s" % view_context.pluralize(session[:counter], "time")
      end
      @products = Product.order(:title)
    end
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
