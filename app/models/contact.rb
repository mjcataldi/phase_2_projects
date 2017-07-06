class Contact < ActiveRecord::Base
  include BCrypt

  has_many :photos, as: :photoable
  has_many :dogs

  validates :first_name, null: false
  validates :last_name, null: false
  validates :email, uniqueness: true, null: false
  validate :password_confirm_valid

  def authenticate?(raw_password)
    self.password == raw_password
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(password_new)
    @password_raw = password_new
    @password = Password.create(password_new, 100)
    self.password_hash = @password
  end

  def password_confirm=(password_confirm)
    @password_confirm = password_confirm
  end

  def password_confirm_valid
    errors.add(:password_confirmation, "Passwords did not match") unless @password_raw == @password_confirm
  end

end
