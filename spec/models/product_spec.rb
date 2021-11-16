require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.new(:name => 'Music')
  subject {
    described_class.new(
      :name => "Guitar",
      :description => "Lorem ipsum",
      :price_cents => 1500,
      :quantity => 20,
      :category => category)
  } 
  describe 'Validations' do
    it 'should save successfully with all four fields set' do
      expect(subject.name).to be_present
      expect(subject.price_cents).to be_present
      expect(subject.quantity).to be_present
      expect(subject.category).to be_present
      subject.valid?
    end

    it 'should fail if no name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'should fail if no price' do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'should fail if no quantity' do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'should fail if no category' do
      subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end
  end
  
end
