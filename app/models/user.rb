class User < ApplicationRecord
  DEFAULT_PLANT_TYPE = 'Tomato'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_reader :password

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :session_token, presence: true

  before_validation :refresh_session_token, on: :create
  before_validation :create_default_plant, on: :create
  before_save :downcase_case_insensitive_fields

  has_many :plants

  def password=(password_string)
    @password = password_string # for password length validation
    self.password_digest = BCrypt::Password.create(password_string)
  end

private

  def create_default_plant
    self.plants.build(type: DEFAULT_PLANT_TYPE)
  end

  def refresh_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def downcase_case_insensitive_fields
    email.downcase!
  end

end