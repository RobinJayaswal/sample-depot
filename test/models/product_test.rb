require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  fixtures :products
  
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  
  test "product price must be positive" do
      product = Product.new(title:       "My Book Title",
                            description: "yyy",
                            image_url:   "zzz.png",
                            price: 10000000)
      assert product.valid?
      
      product.price = -1
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"],
        product.errors[:price]

      product.price = 0
      assert product.invalid?
      assert_equal ["must be greater than or equal to 0.01"], 
        product.errors[:price]

      product.price = 1
      assert product.valid?
    end
  
    def new_product(image_url)
      product = Product.new(title: "Fred",
      description: "Freddy",
      price: 1,
      image_url: image_url)
    end
    
    test "image url's valid" do
      ok = %w{fred.gif fred.jpg fred.png 
        FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
      not_ok = %w{fred.doc fred.gif/more fred.gif.more}
      ok.each do |url| 
        product = new_product(url)
        assert product.valid?, "#{url} should be valid"
      end
      not_ok.each do |url|
        product = new_product(url)
        assert product.invalid?, "#{url} should be valid"
      end
    end
    
    test "product not valid without unique title" do
      product = Product.new(title: products(:ruby).title,
      description: "Ruby",
      image_url: "Somein.jpg",
      price: 5.55)
      
      assert !product.save
      assert_equal "has already been taken", product.errors[:title].join('; ')
    end
    
        
end
