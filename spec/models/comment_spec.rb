require 'rails_helper'

describe Comment do

  context "when product and user exist" do
    # let(:product) { Product.create!(name: "race bike") }
    product = FactoryBot.build(:product)

    before do
      # User.create!(email: "john@doe.com", password: "123456")

      # Have to use create method
      # Otherwise user won't be stored and thus blank
      FactoryBot.create(:user)
    end

    it "is not valid without a rating" do
      expect(product.comments.new(product_id: 1, user_id: 1, body: "Nice bike!")).not_to be_valid
    end

    it "is not valid without a body" do
      expect(product.comments.new(product_id: 1, user_id: 1, rating: 3)).not_to be_valid
    end

    it "is not valid without a user" do
      expect(product.comments.new(product_id: 1, rating: 3, body: "Nice bike!")).not_to be_valid
    end


    it "to be valid when all info is given" do
      expect(product.comments.new(product_id: 1, user_id: 1, rating: 3, body: "Nice bike!")).to be_valid
    end


  end
end
