class ImagesController < ApplicationController
  before_action :set_deployment

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @deployment.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @deployment.save
    redirect_to :back
  end

  private

  def set_deployment
    @deployment = Deployment.friendly.find(params[:deployment_id]) 
  end

  def add_more_images(new_images)
    images = @deployment.images # copy the old images 
    images += new_images # concat old images with new ones
    @deployment.images = images # assign back
  end

  def remove_image_at_index(index)
    remain_images = @deployment.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @deployment.images = remain_images # re-assign back
  end

  def images_params
    params.require(:deployment).permit(:slug, {images: []}) # allow nested params as array
  end
end