class CreateRenta < ActiveRecord::Migration[5.0]
  def change
    create_table :renta do |t|
      t.belongs_to :evento, index: true
      t.belongs_to :materiales_ce, index: true
      t.integer :cantidad
      t.date :fecha
      t.string :folio

      t.timestamps
    end
  end
end
