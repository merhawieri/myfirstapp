require 'rails_helper'

describe Order do
  context "when the user has many orders" do
    @order = FactoryBot.create(:order)

  it "is not valid without a user ID" do
    expect(@order).to be_nil
  end

  end
end
