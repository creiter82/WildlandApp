class CreateUserCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_certifications do |t|
      t.integer :certification_id
      t.integer :user_id

      t.timestamps
    end
  end
end
