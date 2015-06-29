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
    product = products(:i7_2820)
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
    Product.new(title:       "CPU name 10 chars minimum",
                description: "yyy",
                price:       1,
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title:       products(:i7_2820).title,
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid with a title less then 10 symbols" do
    product = Product.new(title:       '123456789',
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.invalid?
    assert_equal ['must be longer than 9 chars'], product.errors[:title]
    
    product = Product.new(title:       '1234567890',
                          description: "yyy", 
                          price:       1, 
                          image_url:   "fred.gif")

    assert product.valid? 
  end
end
