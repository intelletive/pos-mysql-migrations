create table if not exists schema_migration(
  filename varchar(256) primary key,
  date_ran TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
