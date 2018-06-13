class AddReturnedDateToDeployments < ActiveRecord::Migration[5.0]
  def change
    add_column :deployments, :returned_date, :date
  end
end
