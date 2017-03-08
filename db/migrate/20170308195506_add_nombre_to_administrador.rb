class AddNombreToAdministrador < ActiveRecord::Migration[5.0]
  def change
    add_column :administradors, :nombre, :string
  end
end
