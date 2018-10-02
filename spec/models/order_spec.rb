require 'rails_helper'

describe Order do

  let(:product) { Product.create!(name: "mnbike", colour: "blue", description: "Lifechanging Coaching.", price: "45") }

  let(:user) {User.create!(email: "myrandom@email.com", admin: false, password: "Yellow123")}

  it "is a valid order" do
    expect(Order.new(
      user: user,
      product: product,
      total: 100
      )
    ).to be_valid
  end

  it "is not valid without a user" do
    expect(Order.new(
      product: product,
      total: 100
      )
    ).not_to be_valid
  end

  it "is not valid without product" do
    expect(Order.new(
      user: user,
      total: 100
      )
    ).not_to be_valid
  end
end
