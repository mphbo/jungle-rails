require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it 'will not pass validation with mismatched password and password_confirmation' do
      @user = User.new(name: 'Larry', password: 'password', password_confirmation: 'pass', email: 'example@example.com')

      expect(@user).to_not be_valid
    end

    it 'Will not pass validation with an email that is already in the database' do
      @user1 = User.new(name: 'Larry', password: 'password', password_confirmation: 'password', email: 'email@email.com')
      @user1.save
      @user2 = User.new(password: 'pass', password_confirmation: 'pass', email: 'email@email.com')

      expect(@user2).to_not be_valid
    end

    it 'Will not pass validation without a name' do
      @user2 = User.new(password: 'pass', password_confirmation: 'pass', email: 'email1@email.com')

      expect(@user2).to_not be_valid
    end

    it 'Will not pass validation with a password that is less than 3 characters' do
      @user2 = User.new(name: 'Larry', password: 'pa', password_confirmation: 'pa', email: 'email2@email.com')

      expect(@user2).to_not be_valid
    end

    

    
  end
end
