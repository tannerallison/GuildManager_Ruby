class Player < ApplicationRecord

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email

  has_secure_password

  has_many :minions
  has_many :jobs

end
