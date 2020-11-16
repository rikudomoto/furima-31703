class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :family_name,          presence: true
  validates :first_name,           presence: true
  validates :family_name_katakana, presence: true
  validates :first_name_katakana,  presence: true
  validates :birthday,             presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of  :password,   with: PASSWORD_REGEX, message: "Password Include both letters and numbers"
  
  # with_options presence: true do
  #   validates :password,   format: { with: /\A[a-zA-Z0-9]+\z/i,message: "Password Include both letters and numbers"}
  #   validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/i,message: "Password Include both letters and numbers"}
  # end
end
