class CreateRenta < ActiveRecord::Migration[5.0]
  def change
    create_table :renta do |t|
      t.belongs_to :evento, index: true
      t.belongs_to :inventario_ce, index: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
