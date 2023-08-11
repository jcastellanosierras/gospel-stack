CREATE MIGRATION m1hs2rpt6v4o5wz63gpv4b6moqp6yfdmwcsco725i7uhifpri4mvfa
    ONTO m1e63i2znb7oxguklpt3zovtiyxcgxmzqlm6l53w2dzhmneqkv3fja
{
  ALTER TYPE default::Brand {
      ALTER PROPERTY name {
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
