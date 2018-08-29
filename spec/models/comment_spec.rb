require 'rails_helper'

describe Comment do
  context "if product has comments" do

    let(:product) {
      Product.create!(
        name: "Productcomment-test",
        description: "this is comment for production",
        image_url: "image/bike.jpg"
      )
    }

    let(:user) {
      User.create!(email: "merakassala@gmail.com", password: "mera111991")
    }

    it "is invalid without a comment" do
      expect(Comment.new(rating: 5, user: user)).not_to be_valid
    end

    it "is invalid with a rating grater than 5" do
      expect(Comment.new(rating: 6, user: user, body: "invalid comment")).not_to be_valid
    end
  end
end
