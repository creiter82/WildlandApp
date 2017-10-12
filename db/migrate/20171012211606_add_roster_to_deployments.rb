class AddRosterToDeployments < ActiveRecord::Migration[5.0]
  def change
    add_column :deployments, :roster_id, :integer
  end
end
