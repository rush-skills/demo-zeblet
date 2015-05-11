class Booking < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :user
  def to_s
  	self.user.to_s + " - " + self.dpctor.to_s
  end
end
