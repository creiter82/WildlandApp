class RemoveUserIdFromTeamDeployments < ActiveRecord::Migration[5.0]
  def change
    remove_column :team_deployments, :roster_id
  end
end
