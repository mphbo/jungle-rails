require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

      10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "They see all the product details" do
    visit root_path

    click_link(@category.products.first.name)
    
    sleep 2
    save_screenshot 'product-detail.png'
    
    puts @category.products.first.name

    puts page.html

    expect(page).to have_current_path("/products/1")
  end

end
