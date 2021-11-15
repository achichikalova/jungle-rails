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
      expect(subject.price).to be_present
      expect(subject.quantity).to be_present
      expect(subject.category).to be_present
    end

    it 'should fail if no name' do
      subject.name = nil
      expect(subject.errors.full_messages)
    end
    it 'should fail if no price' do
      subject.price = nil
      expect(subject.errors.full_messages)
    end
    it 'should fail if no quantity' do
      subject.quantity = nil
      expect(subject.errors.full_messages)
    end
    it 'should fail if no category' do
      subject.category = nil
      expect(subject.errors.full_messages)
    end
  end
  
end
