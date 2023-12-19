require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer" do
    subject.customer=nil
    expect(subject).to_not be_valid
  end
  it "is not valid if product_name contains more than 50 letters" do
    subject.product_name="a" * 51
    expect(subject).to_not be_valid
  end
  it "is valid if product_name contains letters and numbers" do
    subject.product_name="Test123"
    expect(subject).to be_valid
  end
  it "is not valid if product_count contains letters" do
    subject.product_count="a1"
    expect(subject).to_not be_valid
  end
  it "is not valid if the product_count is negative number" do
    subject.product_count="-1"
    expect(subject).to_not be_valid
  end
  it "is valid if the product_count contains numbers" do
    subject.product_count="123"
    expect(subject).to be_valid
  end
end
