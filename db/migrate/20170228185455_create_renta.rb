class CreateRenta < ActiveRecord::Migration[5.0]
  def change
    create_table :renta do |t|
      t.integer :cantidad

      t.timestamps
    end
  end
end
