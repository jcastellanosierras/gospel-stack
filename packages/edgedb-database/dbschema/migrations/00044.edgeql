CREATE MIGRATION m1plnoxqr33w6iv6xu6dhrftnetvllylkanngl3aqcsmshfcvk7woa
    ONTO m1xqfxby7eoqmmguwiyjazulp6gfzpzrqftmnnoxccyxmo63wdlkea
{
  ALTER TYPE b2c::inventory::SupplierStockLog {
      DROP LINK user;
  };
  ALTER TYPE b2c::inventory::SupplierStockLog {
      CREATE PROPERTY change: std::str;
  };
};
