require 'bcrypt'

class User

  include Mongoid::Document 
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  field :email, type: String
  field :tapatio, type: String
  field :burrito, type: String

  def authenticate(password)
  	self.burrito == BCrypt::Engine.hash_secret(password, self.tapatio)
  end

  def self.authenticate(email,password)
  	user = User.find_by email: email
  	user if user and user.authenticate(password)
  end

  protected

  def encrypt_password	
  	if password.present?
  		self.tapatio = BCrypt::Engine.generate_salt
  		self.burrito = BCrypt::Engine.hash_secret(password, tapatio)
  	end
  end

end