DROP TABLE notes;
DROP TABLE bakes;

CREATE TABLE bakes(
  id SERIAL PRIMARY KEY,
  bake_date VARCHAR(255),
  score INT,
  starter_time VARCHAR(255),
  leaven_time VARCHAR(255),
  autolyse_time VARCHAR(255),
  add_salt_time VARCHAR(255),
  bulk_time VARCHAR(255),
  shape_time VARCHAR(255),
  prove_time VARCHAR(255),
  bake_time VARCHAR(255),
  cool_time VARCHAR(255)
  );

CREATE TABLE notes (
  id SERIAL PRIMARY KEY,
  note_tag VARCHAR(255),
  bake_id INT REFERENCES bakes(id) ON DELETE CASCADE
  );
