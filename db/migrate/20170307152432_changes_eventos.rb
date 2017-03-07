class ChangesEventos < ActiveRecord::Migration[5.0]
  def change
  	execute <<-SQL
	CREATE SEQUENCE folio_sequence START WITH 0 MINVALUE 0;
	ALTER TABLE eventos ALTER COLUMN folio SET NOT NULL;
	ALTER TABLE eventos ALTER COLUMN folio SET DEFAULT nextval('folio_sequence');
	ALTER TABLE eventos ADD PRIMARY KEY (folio);
	SQL
  end
end
