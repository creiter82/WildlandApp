class AddPositionIdToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :position_id, :integer
  end
end
