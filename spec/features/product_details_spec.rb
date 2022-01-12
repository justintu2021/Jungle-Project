require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "See product detail" do
    # ACT
    visit root_path
    page.find('.product:first-child img').click

    # # DEBUG / VERIFY
    save_screenshot
    
    expect(page).to have_text 'Description', count: 1
    expect(page).to have_text @category.products.first.price, count: 1
    expect(page).to have_css ".product-detail"
    puts page.html
  end


end
