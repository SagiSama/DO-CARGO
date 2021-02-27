module Admin

class Worker < Base::Worker
  before_create :set_password_encrypte
  before_update :set_password_encrypte

  attribute :password

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, length: { maximum: 256 }
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6, maximum: 20 }

  def set_password_encrypte
    require 'bcrypt'
    self.encrypted_password = BCrypt::Password.create(password)
  end

end

end
