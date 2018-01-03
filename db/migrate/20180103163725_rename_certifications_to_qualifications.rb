class RenameCertificationsToQualifications < ActiveRecord::Migration[5.0]
  def change
    rename_table :certifications, :qualifications

    rename_table :user_certifications, :user_qualifications
    rename_column :user_qualifications, :certification_id, :qualification_id
  end
end
