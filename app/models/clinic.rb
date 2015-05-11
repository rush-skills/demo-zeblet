# == Schema Information
#
# Table name: clinics
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#

class Clinic < ActiveRecord::Base
	has_many :doctors
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	attr_accessor :doctor_id

	def to_s
		self.name
	end
end
