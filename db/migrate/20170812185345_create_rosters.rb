class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :slug

      t.timestamps
    end
    add_index :rosters, :slug, unique: true
  end
end
