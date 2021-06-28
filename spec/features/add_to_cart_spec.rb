require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "User can see cart updated as things are added" do
    visit root_path

    first('button.btn-primary').click

    sleep 1
    save_screenshot 'add-to-cart.png'

    expect(page).to have_text 'My Cart (1)'
  end
end
