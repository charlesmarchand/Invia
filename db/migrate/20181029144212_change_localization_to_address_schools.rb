class ChangeLocalizationToAddressSchools < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :localisation, :string
    add_column :schools, :address, :string
  end
end
