class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.string :name
      t.text :description
      t.integer :length
      t.integer :difficulty
      t.timestamps
    end
  end
end
