require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      :name => 'Ashly Glory',
      :email => 'test@test.ca',
      :password => 'test',
      :password_confirmation => 'test')
  }

  describe 'Validations' do
    it 'should create user with valid credentials' do
      expect(subject.name).to be_present
      expect(subject.email).to be_present
      expect(subject.name).to be_present
    end

    it 'should check if password = password confirmation' do
      subject.password_confirmation = 'test1'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'should check if email (and not case sensitive) already exist in DB' do
      subject = User.create(
        :name => 'Hanna Smith',
        :email => 'Test@tEst.ca',
        :password => 'test2',
        :password_confirmation => 'test3')

      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'should fail if no name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should fail if no email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should fail if no password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    it 'should fail if password length less then 4' do
      subject.password = '123'
      subject.password_confirmation = '123'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns user with valid credentials' do
      subject.save
      user = User.authenticate_with_credentials('test@test.ca', 'test')
      expect(subject).to be == user
    end

    it 'returns nil if wrong credentials' do
      subject.save
      user = User.authenticate_with_credentials('test@test.ca', 'hdfhd')
      expect(user).to be == nil
    end

    it 'authenticates user if user type white spaces before/after email' do
      subject.save
      user = User.authenticate_with_credentials(' test@test.ca ', 'test')
      expect(subject).to be == user
    end

    it 'authenticates user if user type lower and upper case in email' do
      subject.save
      user = User.authenticate_with_credentials('teSt@tEst.cA', 'test')
      expect(subject).to be == user
    end
  end

end
