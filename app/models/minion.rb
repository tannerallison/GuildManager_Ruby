class Minion < ApplicationRecord
  belongs_to :player
  has_and_belongs_to_many :jobs

  validates_presence_of :name

end
