require 'rails_helper'

RSpec.feature "AddCart", type: :feature, js: true do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
)
    end
  end

  scenario "Add a product to cart" do
    # ACT
    visit root_path
    page.find('.product:first-child button').click
    page.find('.product:nth-child(2) button').click

    # # DEBUG / VERIFY
    save_screenshot
    
    expect(page).to have_text " Cart (2) "
    
    puts page.html
  end


end
