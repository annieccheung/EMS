require 'bcrypt' 
 
PASSWORD_RESET_EXPIRES = 4

class User

  include Mongoid::Document
  include Mongoid::Timestamps

  extend CarrierWave::Mount
  
  attr_accessor :password, :password_confirmation, :image, :image_cache

  mount_uploader :image, ImageUploader


  field :email, type: String
  field :salt, type: String
  field :fish, type: String
  field :code, type: String
  field :expires_at, type: Time
  field :status, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :image, type: String


  before_save :set_random_password, :encrypt_password
  before_save :capitalize_names
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, confirmation: true
  validates :status, presence: true
  validates_inclusion_of :status, :in => ["vet", "rookie"]


  def self.register_user (params)
    # if params[:password].blank? 
    #   User.errors.add(:password, "fill in all of the fields.")
    # else
    user = User.create(params)
    user.store_image!
    user if user
    # end
  end

  def self.authenticate email, password
    user = User.find_by email: email
    user if user and user.authenticate(password)
  end

  def self.find_by_code code
    if user = User.find_by({:code => code, :expires_at => {"$gte" => Time.now.gmtime}})
      user.set_expiration
    end
    user
  end

  def self.find_by_id id
    if user = User.find_by({:id => id})
    end
    user
  end

  def authenticate password
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end


  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.hours.from_now
    self.save
  end

  def reset_password(params)
    if params[:password].blank?
      self.errors.add(:password, "can't be blank")
      false
    else
      if self.update_attributes(params)
        self.update_attributes(params.merge( code: nil, expires_at: nil ))
      end
    end
  end

  def self.options_for_emt_vet
    @options = []
    @users = User.where(:status => 'vet')
    @options = @users.map { |user| [user.last_name] }

    @options
  end

  def self.options_for_emt_rookie
    @options = []
    @users = User.where(:status => 'rookie')
    @options = @users.map { |user| [user.last_name] }

    @options
  end

  protected

    def set_random_password
      if self.fish.blank? and password.blank?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(SecureRandom.base64(32), self.salt)
      end
    end

    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.fish = BCrypt::Engine.hash_secret(password, self.salt)
      end
    end

    def capitalize_names
      ['first_name', 'last_name'].each do |name|
        self.attributes[name] = self.attributes[name].capitalize
      end
    end

end