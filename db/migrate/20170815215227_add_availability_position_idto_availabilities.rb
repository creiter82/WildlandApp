class AddAvailabilityPositionIdtoAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :availability_position_id, :integer
  end
end
