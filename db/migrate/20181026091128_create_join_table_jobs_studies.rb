class CreateJoinTableJobsStudies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :studies, :jobs
  end
end
