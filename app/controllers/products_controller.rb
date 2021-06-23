class ProductsController < ApplicationController

  def index
  puts "prefix: #{ENV['STRIPE_PUBLISHABLE_KEY']}"
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
