class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :roster_id
      t.integer :user_id

      t.timestamps
    end
  end
end
