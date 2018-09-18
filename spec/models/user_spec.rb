require 'rails_helper'

describe User do

  let(:user) {
    User.create!(email: "merhytkassla@gmail.com", password: "mejuya11991")
  }

  it "is a valid user" do
    expect(user.email).to eq "merhytkassla@gmail.com"
  end

  it "is a valid password" do
    expect(user.password).to eq "mejuya11991"
   end

end
