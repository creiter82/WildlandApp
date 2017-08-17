class AddSlugToDeployments < ActiveRecord::Migration[5.0]
  def change
    add_column :deployments, :slug, :string
    add_index :deployments, :slug, unique: true
  end
end
