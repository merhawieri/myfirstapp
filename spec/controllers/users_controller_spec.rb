require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { User.create!(email: 'abioke@gmail.com', password: '1234567890')}
  let(:astr) { User.create!(email: 'robiykey@gmail.com', password: '9876543210') }
  describe 'GET #show'do

       context 'when user is logged in' do

         it 'loads correct user details' do
           get :show, params: { id: user.id }
           expect(response).to be_ok
           expect(assigns(:user)).to eq user
         end
       end

       context 'when a user is not logged in' do
         it "redirects to login if user is not logged in" do
           get :show, params: { id: user.id }
           expect(response).to redirect_to(new_user_session_path)
         end
       end

       context 'when a user is logged in try to acces other users page' do

         it 'redirect to home' do
           get :show, params: { id: user.id }
           expect(response).to have_http_status(302)
           expect(response).to redirect_to(root_path)
         end
       end
     end
   end
