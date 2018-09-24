require 'rails_helper'

describe User do

  let(:user) { FactoryBot.create(:user, password: "test123") }

  it "is a valid user" do
    expect(user.email).to match (/jim_[0-9\.]+@example.com/)
  end

  it "is not a valid password" do
    expect(user.password).to eq "test123"
   end
end
