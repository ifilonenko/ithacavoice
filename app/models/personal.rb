# == Schema Information
#
# Table name: personals
#
#  id              :integer          not null, primary key
#  product_name    :string
#  product_details :string
#  product_price   :string
#  email           :string
#  tagphoto_url    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Personal < ActiveRecord::Base
  has_one :tagphoto, class_name: 'Image', as: :imageable
end
