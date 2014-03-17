require 'bcrypt'

PASSWORD_RESET_EXPIRES = 4

class User

  include Mongoid::Document 
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  before_save :set_random_password, :encrypt_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  field :email, type: String
  field :tapatio, type: String
  field :burrito, type: String
  field :code, type: String
  field :expires_at, type: Time

  def authenticate(password)
  	self.burrito == BCrypt::Engine.hash_secret(password, self.tapatio)
  end

  def self.authenticate(email,password)
  	user = User.find_by email: email
  	user if user and user.authenticate(password)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save! 
  end

  protected

  def set_random_password
    if self.burrito.blank? and password.blank?
      self.tapatio = BCrypt::Engine.generate_salt
      self.burrito = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.tapatio)
    end
  end

  def encrypt_password	
  	if password.present?
  		self.tapatio = BCrypt::Engine.generate_salt
  		self.burrito = BCrypt::Engine.hash_secret(password, tapatio)
  	end
  end


end