require 'bcrypt'

class User

  include Mongoid::Document 
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password

  field :email, type: String
  field :tapatio, type: String
  field :burrito, type: String

  def encrypt_password
  	puts "THIS IS HAPPENING BEFORE SAVE... woah....#{self.password}"
  	if password.present?
  		self.tapatio = BCrypt::Engine.generate_salt
  		self.burrito = BCrypt::Engine.hash_secret(password, tapatio)
  	end
  end

end