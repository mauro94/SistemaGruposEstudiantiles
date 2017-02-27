class CreateAdministradors < ActiveRecord::Migration[5.0]
  def change
    create_table :administradors do |t|
      t.string :departamento
      t.departamento :consejo

      t.timestamps
    end
  end
end
