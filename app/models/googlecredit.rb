# == Schema Information
#
# Table name: googlecredits
#
#  id            :integer          not null, primary key
#  outh_token    :string
#  access_token  :string
#  refresh_token :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Googlecredit < ActiveRecord::Base
end
