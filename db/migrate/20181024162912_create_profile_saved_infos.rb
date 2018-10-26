class CreateProfileSavedInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_saved_infos do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.references :study, foreign_key: true
      t.references :diploma, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
