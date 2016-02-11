# frozen_string_literal: true

class Visitor < ActiveRecord::Base
  has_many :visits
  has_many :hosts, through: :visits

  has_attached_file :photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: ["image/png", "image/jpeg", "image/jpg"]

  validates :first_name, :last_name, :photo, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
