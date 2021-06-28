require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'a product with name, price, quantity and category will pass validation' do
      # puts product.inspect
      @category = Category.new(name: 'Thomas')
      @category.save
      @product = Product.new(name: 'Larry', price: 10, quantity: 1, category: @category)

      @product.save!
      expect(@product).to be_valid

     end
   

    it 'a product missing a name will not pass validation' do
      # puts product.inspect
      @category = Category.new(name: 'Thomas')
      @product = Product.new(price: 10, quantity: 1, category: @category)

      expect(@product).to_not be_valid 
    end

    it 'a product missing a price will not pass validation' do
      # puts product.inspect
      @category = Category.new(name: 'Thomas')
      @category.save
      @product = Product.new(name: 'Larry', quantity: 1, category: @category)

      @product.save

      expect(@product).to_not be_valid 
    end

    it 'a product missing a quantity will not pass validation' do
      # puts product.inspect
      @category = Category.new(name: 'Thomas')
      @product = Product.new(price: 10, name: 'Larry', category: @category)

      expect(@product).to_not be_valid 
    end

    it 'a product missing a category will not pass validation' do
      # puts product.inspect
      @category = Category.new(name: 'Thomas')
      @category.save
      @product = Product.new(name: 'Larry', quantity: 1, price: 10)

      @product.save

      expect(@product).to_not be_valid 
    end
  
  end
end
