class CreateDeployments < ActiveRecord::Migration[5.0]
  def change
    create_table :deployments do |t|
      t.string :name
      t.text :location

      t.timestamps
    end
  end
end
