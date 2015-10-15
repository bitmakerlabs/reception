class Visitor < ActiveRecord::Base
  has_many :visits
  has_many :hosts, through: :visits
end
