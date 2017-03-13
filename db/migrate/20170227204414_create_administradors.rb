class CreateAdministradors < ActiveRecord::Migration[5.0]
  def change
    create_table :administradors, id: false, primary_key: :id do |t|
      t.belongs_to :admin, index: true
      t.string :departamento
      t.string :consejo
      t.string :id

      t.timestamps
    end
  end
end
