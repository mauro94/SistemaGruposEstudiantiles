class CambioDbEventos < ActiveRecord::Migration[5.0]
  def change
  	execute <<-SQL
 	CREATE SEQUENCE grupoestudiantils_sequence START WITH 0 MINVALUE 0;
 	ALTER TABLE grupo_estudiantils ALTER COLUMN grupo_id SET NOT NULL;
 	ALTER TABLE grupo_estudiantils ALTER COLUMN grupo_id SET DEFAULT nextval('grupoestudiantils_sequence');
 	ALTER TABLE grupo_estudiantils ADD PRIMARY KEY (grupo_id);
 	SQL
  end
end
