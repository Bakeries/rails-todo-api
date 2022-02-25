class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  has_many :todos, :dependent => :destroy, foreign_key: :created_by
  # Validations
  validates_presence_of :username, :password_digest

  # Making each user unique
  validates :username, presence: true
  validates :username, uniqueness: {message: "Username has already been taken"}
end
