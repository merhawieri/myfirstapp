require 'rails_helper'
describe CommentsController, type: :controller do
  context 'autehnticated user' do
    before(:each) do
      @user = User.create!(email: "myrandom@email.com", admin: false, password: "Yellow123")
      sign_in @user
    end
    it "can add comments" do
      @product = FactoryBot.create(:product)
      @comment = FactoryBot.build(:comment, product_id: @product.id, user: @user )
      expect(@comment).to be_valid
     end
   end
end
