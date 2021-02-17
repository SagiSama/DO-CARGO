class Admin::Worker < Base::Worker
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, length: { maximum: 256 }
  validates_uniqueness_of :email
end
