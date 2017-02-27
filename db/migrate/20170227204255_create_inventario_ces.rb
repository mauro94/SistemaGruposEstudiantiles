class CreateInventarioCes < ActiveRecord::Migration[5.0]
  def change
    create_table :inventario_ces do |t|
      t.int :cantidad

      t.timestamps
    end
  end
end
