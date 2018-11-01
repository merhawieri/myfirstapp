require 'rails_helper'

describe Product do

  context "when the product has comments" do
    # let(:product) { Product.create!(name: "super bike") }
    product = FactoryBot.create(:product)

    # let(:user) { User.create!(email: "marc@smith.com", password: "123456")}
    user = FactoryBot.build(:user)


    before do
      # product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      # product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      # product.comments.create!(rating: 5, user: user, body: "Great bike!")
      FactoryBot.create(:comment, rating: 1, body: "bad bike", product: product)
      FactoryBot.create(:comment, rating: 3, product: product)
      FactoryBot.create(:comment, rating: 5, body: "awesome it is", product: product)
    end

    it "returns the highest rating of all comments" do
      expect(product.highest_rating_comment.rating).to eq 5
      expect(product.highest_rating_comment.body).to eq "awesome it is"

    end

    it "returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.rating).to eq 1
      expect(product.lowest_rating_comment.body).to eq "bad bike"
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end

  end
end
