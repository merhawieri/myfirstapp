require 'rails_helper'
describe CommentsController, type: :controller do
  context 'autehnticated user' do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in @user
    end
    it "can add comments" do
      @product = FactoryBot.create(:product)
      @comment = FactoryBot.build(:comment, product_id: @product.id, user: @user )
      expect(@comment).to be_valid
     end
   end
end
