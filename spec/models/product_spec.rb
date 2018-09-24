require 'rails_helper'
 describe Product do
   let(:product) {
     # product_category = Category.create!(product_category: "Sessions", name: "30 Minute Midgrade", colour: "blue", description: "Lifechanging Coaching.", price: 45 )
     Product.create!(name: "30 Minute Midgrade", colour: "blue", description: "Lifechanging Coaching.", price: 45)
   }

   let(:user) { FactoryBot.create(:user) }

    before do
      product.comments.create!(rating: 1, user: user, body: "Bad Session")
      product.comments.create!(rating: 3, user: user, body: "Ok Session")
      product.comments.create!(rating: 5, user: user, body: "Great Session!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      product=FactoryBot.build(:product, name: nil)
      expect(product.valid?).not_to be_truthy
    end

end
