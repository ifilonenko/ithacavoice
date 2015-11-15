class BusinessesController < ApplicationController
  def ad
  end
  def create
    @business = Business.new(post_params)
    @image = Image.create(file: params[:business][:tagphoto], imageable_type: 'Post', imageable_id: @business.id)
    @business.update_attributes(tagphoto_url: @image.file.url)
    # Need Mailchimp
    
    #PersonalAddMailer.send_mail(@personal).deliver_now 
    redirect_to root_path
  end
  private
  def post_params
    params.require(:business).permit(:business_name, :business_description, :email, :tier)
  end
end
