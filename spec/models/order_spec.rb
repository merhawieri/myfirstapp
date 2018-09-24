require 'rails_helper'

describe Order do

  let(:product) { FactoryBot.create(:product) }

  let(:user) { FactoryBot.create(:user) }

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
