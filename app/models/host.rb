class Host < ActiveRecord::Base
  self.primary_key = 'slack_id'

  has_many :visits
  has_many :visitors, through: :visits

  def name
    "#{first_name} #{last_name}"
  end
end
