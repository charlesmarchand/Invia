class AddCategoryToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :category, index: true
  end
end
