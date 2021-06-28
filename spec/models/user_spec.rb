require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it 'will not pass validation with mismatched password and password_confirmation' do
      @user = User.new(first_name: 'Larry', last_name: 'Tate', password: 'password', password_confirmation: 'pass', email: 'example@example.com')

      expect(@user).to_not be_valid
    end

    it 'Will not pass validation with an email that is already in the database' do
      @user1 = User.new(first_name: 'Larry', last_name: 'Tate', password: 'password', password_confirmation: 'password', email: 'email@email.com')
      @user1.save
      @user2 = User.new(password: 'pass', password_confirmation: 'pass', email: 'email@email.com')

      expect(@user2).to_not be_valid
    end

    it 'Will not pass validation without a name' do
      @user2 = User.new(password: 'pass', password_confirmation: 'pass', email: 'email1@email.com')

      expect(@user2).to_not be_valid
    end

    it 'Will not pass validation with a password that is less than 3 characters' do
      @user2 = User.new(first_name: 'Larry', last_name: 'Tate', password: 'pa', password_confirmation: 'pa', email: 'email2@email.com')

      expect(@user2).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should match password and email' do
      user = User.create(first_name: 'Larry', last_name: 'Tate', email: 'email@email.com', password: 'password', password_confirmation: 'password')

      session = User.authenticate_with_credentials('email@email.com', 'password')
      expect(session).to eq user
    end

   it 'should match when there is a space in front and at the end of email' do
      user = User.create(first_name: 'Larry', last_name: 'Tate', email: 'email@email.com', password: 'password', password_confirmation: 'password')

      session = User.authenticate_with_credentials(' email@email.com ', 'password')
      expect(session).to eq user
    end 

  it 'should match when user uses wrong cases' do
      user = User.create(first_name: 'Larry', last_name: 'Tate', email: 'email@email.com', password: 'password', password_confirmation: 'password')

      session = User.authenticate_with_credentials('email@Email.com', 'password')
      expect(session).to eq user
    end
  end
end



