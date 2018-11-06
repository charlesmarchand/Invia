class RemoveDescriptionFromSchools < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :description

  end
end
