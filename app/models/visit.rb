class Visit < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :host

  accepts_nested_attributes_for :visitor
end
