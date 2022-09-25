class User < ApplicationRecord
  # 保存する直前にメールアドレスを小文字に変換し一意性を保証する
  # before_save { self.email = email.downcase }
  before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, 
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false } # 一意チェック・
            
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
