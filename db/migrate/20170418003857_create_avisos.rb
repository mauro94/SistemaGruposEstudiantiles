class CreateAvisos < ActiveRecord::Migration[5.0]
  def change
    create_table :avisos do |t|
    	t.belongs_to :evento, index: true
    	t.belongs_to :grupo, index: true
    	t.string :mensaje
    	t.string :departamento
      t.string :remitente
    	t.string :consejo
    	t.string :titulo
      t.timestamps
    end
  end
end
