require 'rails_helper'

describe ProductsController, type: :controller do
  # let(:pina) { User.create!(email: "pina@colada.com", password: "123456", admin: true) }
  # let(:john) { User.create!(email: "john@doe.com", password: "123456", admin: false)}

  describe 'GET #index' do
    before do
      FactoryBot.create(:product)
      FactoryBot.create(:product, name: "car", price: 22)
    end

    context 'user performes search'
      #Explicitly render views to check if they include the search term
      render_views

      it 'renders only products including the search term' do
        get :index, params: {q: "bike"}
        expect(response).to be_ok
        expect(response.body).to include("bike")
        expect(response.body).to_not include("car")
      end


    context 'user performes search' do
      #Explicitly render views to check if they include the search term
      render_views

      it 'renders all products' do
        get :index
        expect(response).to be_ok
        expect(response.body).to include("bike")
        expect(response.body).to include("car")
      end
    end
  end

  describe 'GET #show' do

    context 'when individual product is clicked' do
      before do
        FactoryBot.create(:product, id: 2)
      end

      it 'renders product page' do
         get :show, params: {id: 2}
         expect(response).to be_ok
      end
    end
  end

  describe 'GET #new' do
    context 'when admin is logged in' do
      before do
        @user = FactoryBot.create(:admin)
        sign_in @user
      end

      it 'renders the product new form' do
        get :new
        expect(response).to be_ok
      end
    end

    context 'when regular user is logged in' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it 'redirects to root_url' do
        get :new
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET #edit' do
    context 'when admin is logged in' do
      before do
        FactoryBot.create(:product, id: 23)
        @user = FactoryBot.create(:admin)
        sign_in @user
      end

      it 'renders the product edit form' do
        get :edit, params: {id: 23}
        expect(response).to be_ok
      end
    end

    context 'when regular user is logged in' do
      before do

        FactoryBot.create(:product, id: 23)

        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it 'redirects to root_url' do
        get :edit, params: {id: 23}
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'POST #create' do
    context 'when admin is logged in' do
      before do
        @user = FactoryBot.create(:admin)
        sign_in @user
      end

      # both 'creates article' tests do the same
      # leaving them for personal reference
      it "creates product" do
        article_params = FactoryBot.attributes_for(:product)
        expect { post :create, params: {product: article_params} }.to change(Product, :count).by(1)
      end

      it "creates product" do
        expect{ post :create, params: {product: FactoryBot.attributes_for(:product)}
        }.to change(Product,:count).by(1)
        expect(response).to redirect_to("http://test.host/products/2")
      end

      it "creates product" do
        article_params = FactoryBot.attributes_for(:product)
        expect{ post :create, params: {product: article_params, name: "new name"}
        }.to change(Product,:count).by(1)

      end

    end

    context 'when regular user is logged in' do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it "does not create an article" do
        article_params = FactoryBot.attributes_for(:product)
        expect { post :create, params: {product: article_params} }.to change(Product, :count).by(0)
        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'PUT #update' do
    before do
      @product = FactoryBot.create(:product)
    end

    it 'updates the product' do
        article_params = FactoryBot.attributes_for(:product)
        expect{ put :update, params: {id: @product.id, product: article_params }
        }.to change(Product,:count).by(0)
        expect(flash[:notice]).to eq 'Product was successfully updated.'
    end
  end


  describe 'DELETE #destroy' do
    before do
      @product = FactoryBot.create(:product)
    end

    it 'deletes the product' do
      expect { delete :destroy, params: { id: @product.id } }.to change(Product, :count).by(-1)
      expect(flash[:notice]).to eq 'Product was successfully destroyed.'
    end
  end

end
