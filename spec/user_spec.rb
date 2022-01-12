require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a valid user when all fields are correctly entered' do
      @user = User.new name:'Hi', email:'124@gmail.com', password:'12345', password_confirmation:'12345'
      @user.save
      expect(@user).to be_valid
    end
    it 'should throw error when when password and password_confirmation field do not match' do
      @user= User.new name:'Hi', email:'alex@gmail.com', password:'1111111', password_confirmation:'12344444'
      @user.save
      expect(@bruh.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'should throw error when when password is blank' do
      @user = User.new name:'Hi',email:'124@gmail.com', password:'', password_confirmation:""
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'should throw error when name is empty' do
      @user = User.new name:'',email:'124@gmail.com', password:'12345', password_confirmation:'12345'
      @user.save
      expect(@user.errors.full_messages).to include "Please input your name"
    end
    
    it 'should throw error when user leave the email empty' do
      @user = User.new name:'Hi',email:'', password:'12345', password_confirmation:'12345'
      @user.save
      expect(@user.errors.full_messages).to include "Please input your email"
    end
    it 'should throw error when email is not unique' do
      @user = User.new(name:'Hi',email:'user@gmail.com', password:'12345', password_confirmation:'12345'
      @user.save
      @user2 = User.new(name:'Hi',email:'user@gmail.com', password:'12345', password_confirmation:'12345'
      @user2.save
      expect(@user2.errors.full_messages).to include "Your email registered"
    end
    it 'should throw error when when password is too short' do
      @user = User.new name:'Hi',email: '124@gmail.com', password:'12', password_confirmation:'12'
      @user.save
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 4 characters)"
    end
  end
end
  