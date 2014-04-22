class User < ActiveRecord::Base
	has_many :requests

  # validates :password, length: { minimum: 3 }
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true

  validates :email, uniqueness: true
  # validates :name, uniqueness: true
  # validates :name, length: { minimum: 5 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
