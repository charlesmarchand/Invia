class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :job
      t.string :school
      t.string :linkedin_link

      t.timestamps
    end
  end
end
