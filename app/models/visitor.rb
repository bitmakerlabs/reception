class Visitor < ActiveRecord::Base
  has_many :visits
  has_many :hosts, through: :visits

  has_attached_file :photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: ["image/png"]
end
