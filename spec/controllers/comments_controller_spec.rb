require 'rails_helper'
describe CommentsController, type: :controller do

  context 'writes a comment' do
    before do
      let(:user) { User.create!(email: "ronndom@emil.com", password: "tesyrtnow") }
          let(:product) { Product.create!(name: "mn bike", description: "awesome bike",colour: "red", price: "190") }
    end

    before do
      sign_in user
    end

    it 'submitts a comment on the product page' do
      expect(response).to have_http_status(200)
    end
  end

end
