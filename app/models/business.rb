# == Schema Information
#
# Table name: businesses
#
#  id                   :integer          not null, primary key
#  business_name        :string
#  business_description :string
#  email                :string
#  tagphoto_url         :string
#  tier                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Business < ActiveRecord::Base
end
