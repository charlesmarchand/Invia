class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :keywords

      t.timestamps
    end
  end
end
