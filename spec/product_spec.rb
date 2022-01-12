def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

RSpec.describe Product, type: :model do
  describe 'Validation' do
    
    it "return nil if we don't input name" do
      @category = Category.new(name: "fashion")
      @product = Product.new(description: "men",image: open_asset('apparel1.jpg'), price_cents: 64.99, quantity: 3)
      get_name = @product.name

      expect(get_name).to be_nil
    end

    it "return nil if we don't input description" do
      @category = Category.new(name: "fashion")
      @product = Product.new(name: "highlight",image: open_asset('apparel1.jpg'), price_cents: 64.99, quantity: 3)
      get_description = @product.description

      expect(get_description).to be_nil
    end

    it "return nil if we don't input description" do
      @category = Category.new(name: "fashion")
      @product = Product.new(name: "highlight", description: "young age", image: open_asset('apparel1.jpg'), price_cents: 64.99, quantity: 3)
      get_description = @product.description

      expect(get_description).to eq("young age")
    end
  end
end