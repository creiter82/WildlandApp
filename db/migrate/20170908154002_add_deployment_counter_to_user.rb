class AddDeploymentCounterToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deployments_count, :integer, null: false, :default => 0
  end
end
