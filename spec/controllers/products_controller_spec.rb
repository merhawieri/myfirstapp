require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)

  end

  describe 'GET #index' do
    it 'renders products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    it 'renders the login page' do
      get :show, params: {id: @product}
      expect(response).to redirect_to new_user_session_path
    end
  end

  context 'GET #new' do
    before do
      sign_in @user
    end
    it 'redirects to new product page' do
      get :new, params: {id: @product}
      expect(response).to be_ok
    end
  end

  context 'GET #edit' do
    it 'redirects to login page' do
      get :edit, params: {id: @product.id}
      expect(response).to redirect_to new_user_session_path
    end
  end

  context "POST #create" do
    before do
      sign_in @user
    end

    it "creates a new product" do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end
    it "cannot create a product" do
       expect(Product.new(price:'string', description: '')).not_to be_valid
    end
  end
  describe 'PATCH #update' do it "requires login" do

  patch :update, params: {id: @product.id}
expect(response).to redirect_to new_user_session_path end

    context 'DELETE' do
      before do
        sign_in @user
      end

      it 'can delete a product' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to products_url
      end
    end

end
end
