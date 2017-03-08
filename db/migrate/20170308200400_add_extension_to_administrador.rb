class AddExtensionToAdministrador < ActiveRecord::Migration[5.0]
  def change
    add_column :administradors, :extension, :integer
  end
end
