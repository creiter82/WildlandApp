class AddAssignmentToDeployment < ActiveRecord::Migration[5.0]
  def change
    add_column :deployments, :assignment, :string
  end
end
