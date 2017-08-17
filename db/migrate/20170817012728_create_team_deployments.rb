class CreateTeamDeployments < ActiveRecord::Migration[5.0]
  def change
    create_table :team_deployments do |t|
      t.integer :deployment_id
      t.integer :roster_id
      t.integer :user_id

      t.timestamps
    end
  end
end
