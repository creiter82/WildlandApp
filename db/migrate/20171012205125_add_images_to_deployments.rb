class AddImagesToDeployments < ActiveRecord::Migration[5.0]
  def change
    add_column :deployments, :feature_image, :string
    add_column :deployments, :images, :json
  end
end
