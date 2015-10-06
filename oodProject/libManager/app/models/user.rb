class User < ActiveRecord::Base
  #attr_accessor :password
  #attr_accessor :name, :email #new line
  cattr_accessor :current_user
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  before_save :alter_data
  before_save :create_remember_token

  def alter_data
    self.email = email.downcase
    #self.ty = 2
  end

  validates :name, :presence => true,
            length: {maximum: 50}

  validates :email, :presence => true,
            :uniqueness => {:case_sensitive => false},
            :format => {:with => EMAIL_REGEX}

  validates :password, :length => {:within => 6..40}

  validates :password_confirmation, presence: true

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end