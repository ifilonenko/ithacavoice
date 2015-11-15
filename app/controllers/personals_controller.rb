require Rails.root.join('app/mailers/personal_add_mailer').to_path
class PersonalsController < ApplicationController
  def ad
  end
  def create
    @personal = Personal.new(post_params)
    @image = Image.create(file: params[:personal][:tagphoto], imageable_type: 'Post', imageable_id: @personal.id)
    @personal.update_attributes(tagphoto_url: @image.file.url)
    # Need Mailchimp

    #PersonalAddMailer.send_mail(@personal).deliver_now 
    redirect_to root_path
  end
  private
  def post_params
    params.require(:personal).permit(:product_name, :product_details, :product_price, :email, :tier)
  end
end

