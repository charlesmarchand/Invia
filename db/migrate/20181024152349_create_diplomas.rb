class CreateDiplomas < ActiveRecord::Migration[5.2]
  def change
    create_table :diplomas do |t|
      t.string :name
      t.integer :length
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
