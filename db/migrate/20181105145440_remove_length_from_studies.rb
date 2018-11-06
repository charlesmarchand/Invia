class RemoveLengthFromStudies < ActiveRecord::Migration[5.2]
  def change
    remove_column :studies, :length
    remove_column :studies, :difficulty

  end
end
