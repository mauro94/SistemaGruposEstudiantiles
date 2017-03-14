class CambioDbGrupos2 < ActiveRecord::Migration[5.0]
  def change
  	execute <<-SQL
 	ALTER TABLE grupo_estudiantils RENAME COLUMN grupo_id TO id
 	SQL
  end
end
