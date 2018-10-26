class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|

      t.timestamps
    end
  end
end
