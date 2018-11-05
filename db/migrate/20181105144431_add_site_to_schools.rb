class AddSiteToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :web_site, :string
  end
end
