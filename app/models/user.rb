class User < ActiveRecord::Base
  attr_accessor :password

  attr_accessible :code, :email, :name, :password, :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :code

  self.per_page = 10    # 定义每页的显示记录数

  before_save :encrypt_password

  def encrypt_password
    # 如果未设置密码，则默认为123456
    self.password = "123456" unless self.password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
  end

  def self.authenticate(code, password)
    user = find_by_code(code)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
