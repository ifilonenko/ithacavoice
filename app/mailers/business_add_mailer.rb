require 'mailgun'
class BusinessAddMailer < ActionMailer::Base
  default from: "\"ADVoICE \" <ilan.fil@gmail.com>"
  def send_mail(ad)
    email = ad.email
    name = ad.product_name
    details = ad.product_details
    photo = ad.tagphoto_url
    tier = ad.tier
    mail(to: "ilan.fil@gmail.com", subject: "Personal Ad Order from #{ email }", body: "Dear Ithaca Voice, I wish to advertise my product with this following information. Product Name: #{ name }; Product Details: #{ details }; Photo URL: #{ photo }; Tier: #{ tier }")
  end
end