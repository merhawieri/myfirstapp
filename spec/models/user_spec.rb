require 'rails_helper'

describe User do

  let(:user) {
    User.create!(email: "merakassla@gmail.com", password: "mera11991")
  }

  it "is a valid user" do
    expect(user.email).to eq "merakassla@gmail.com"
  end

  it "is a valid password" do
    expect(user.password).to eq "mera11991"
   end

end
