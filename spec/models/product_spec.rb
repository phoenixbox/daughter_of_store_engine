require File.dirname(__FILE__) + '/../spec_helper'

describe Product do
  before (:each) do
    @store = FactoryGirl.create(:store)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:product, store: @store)).to be_valid
  end

  it 'is invalid without a title' do
    expect(FactoryGirl.build(:product, store: @store, title: '')).to_not be_valid
  end

  it 'is invalid without a description' do
    expect(FactoryGirl.build(:product, store: @store, description: '')).to_not be_valid
  end

  it 'is invalid if title already exists (case insensitive)' do
    FactoryGirl.create(:product, store: @store)
    product = FactoryGirl.build(:product, store: @store)
    expect(product.valid?).to be_false
  end

  it 'is invalid without a price' do
    expect(FactoryGirl.build(:product, store: @store, price: nil)).to_not be_valid
  end

  it 'is invalid without a price greater than 0' do
    expect(FactoryGirl.build(:product, store: @store, price: 0)).to_not be_valid
  end

  it 'is only valid with two or less decimal points' do
    expect(FactoryGirl.build(:product, store: @store, price: 0.123)).to_not be_valid
    expect(FactoryGirl.build(:product, store: @store, price: 0.10)).to be_valid
    expect(FactoryGirl.build(:product, store: @store, price: 0.1)).to be_valid
    expect(FactoryGirl.build(:product, store: @store, price: 2)).to be_valid
  end

  it 'is invalid without a status' do
    expect(FactoryGirl.build(:product, store: @store, status: nil)).to_not be_valid
  end

  it 'is invalid with a status other than active or retired' do
    expect(FactoryGirl.build(:product, store: @store, status: 'active')).to be_valid
    expect(FactoryGirl.build(:product, store: @store, status: 'retired')).to be_valid
    expect(FactoryGirl.build(:product, store: @store, status: 'something')).to_not be_valid
  end

  it 'has the ability to be assigned to multiple categories' do
    nicknacks = FactoryGirl.create(:category, title: 'nicknacks')
    superheroes = FactoryGirl.create(:category, title: 'superheroes')
    product = FactoryGirl.create(:product, store: @store, categories: [nicknacks, superheroes])
    expect(product.categories.count).to eq 2
  end

  describe '.toggle_status' do
    context 'on an active product' do
      it 'sets the status from active to retired' do
        product = FactoryGirl.create(:product, store: @store, status: 'active')
        product.toggle_status
        expect(product.status).to eq 'retired'
      end
    end

    context 'on a retired product' do
      it 'sets the statusto active' do
        product = FactoryGirl.create(:product, store: @store, status: 'retired')
        product.toggle_status
        expect(product.status).to eq 'active'
      end
    end
  end
end
