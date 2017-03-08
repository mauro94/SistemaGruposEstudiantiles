class AddCorreoToAdministrador < ActiveRecord::Migration[5.0]
  def change
    add_column :administradors, :correo, :string
  end
end
