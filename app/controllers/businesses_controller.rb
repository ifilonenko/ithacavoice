class BusinessesController < ApplicationController
  def ad
  end
  def create
    @business = Business.new(post_params)
    @image = Image.create(file: params[:business][:tagphoto], imageable_type: 'Post', imageable_id: @business.id)
    @business.update_attributes(tagphoto_url: @image.file.url)
    # Need Mailchimp
    #PersonalAddMailer.send_mail(@personal).deliver_now 
    # Need GoogleDrive
    # uri = URI.parse("//www.googleapis.com/drive/v2/files")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # request = Net::HTTP::Post.new("/v1.1/auth")
    # request.add_field('Content-Type', 'application/json')
    # request.body = {'title':'pets','mimeType':'application/vnd.google-apps.folder'}
    # response = http.request(request)
    # redirect_to root_path
  end
  private
  def post_params
    params.require(:business).permit(:business_name, :business_description, :email, :tier)
  end
end
