class User < ActiveRecord::Base
  validates :user_name, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :session_token, uniqueness: true, presence: true
  validates :password, length: { minimum: 5, allow_nil: true }

  after_initialize :ensure_session_token
  attr_reader :password


  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    ensure_session_token
    self.save!
    self.session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.correct_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def correct_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  has_many :cats,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :user_id

end
