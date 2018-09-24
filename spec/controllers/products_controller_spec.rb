require 'rails_helper'

describe ProductsController, type: :controller do
  context 'unauthenticated user' do
    it 'cannot edit' do
      @product = FactoryBot.create(:product)
      get :edit, params:{id: @product.id}
      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:alert]).to match("You need to sign in or sign up before continuing.")
    end
  end
end
