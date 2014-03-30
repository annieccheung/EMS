require 'spec_helper'

describe User do 

  it "is valid with an email" do
    user = User.new(
      email: 'annieccheung@gmail.com'
    )
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new
    expect(user).to be_invalid
  end

  it "is valid if password matchs password_confirmation" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '123'
    )
    expect(user).to be_valid
  end

  it "is invalid if password doesn't match password_confirmation" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    expect(user).to be_invalid
  end

  it "should be able to generate a salt" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    user.instance_eval { encrypt_password }
    expect(user.salt).not_to be_empty
  end

  it "should be able to generate a fish" do
    user = User.new(
      email: 'annieccheung@gmail.com',
      password: '123',
      password_confirmation: '12345'
    )
    user.instance_eval { encrypt_password }
    expect(user.fish).not_to be_empty
  end

  it "is invalid without a salt" 

  it "is invalid without a fish"

#case sensitive
#field types
#capitalize names
#email format @ and . 
#


end