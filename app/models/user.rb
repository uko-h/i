class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :user_categories
  has_many :categories, through: :user_categories

  devise :validatable, password_length: 7..128
  devise :validatable, email_regexp: /\A\S[a-z\d]+@\S[a-z\d]+\.\S+\z/
  validates :nickname, presence: true, length: { in: 1..20, message: 'ニックネームを1〜20文字で入力してください'}
end
