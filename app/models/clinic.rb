# == Schema Information
#
# Table name: clinics
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Clinic < ActiveRecord::Base
	has_many :doctors
end
