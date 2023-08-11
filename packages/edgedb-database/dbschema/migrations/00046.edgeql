CREATE MIGRATION m1gc7xzwdrz3fwx4dtl2eqouderaegjog6jhkrrkueouz2nohfzpga
    ONTO m1n5m463nal4wjgllh5hkvzncrkpyaddmxqjnu76qwi3ekcigm542q
{
  ALTER TYPE b2c::inventory::SupplierStock {
      CREATE TRIGGER log_stock_updates_modifications
          AFTER UPDATE 
          FOR EACH DO (INSERT
              b2c::inventory::SupplierStockLog
              {
                  action := 'update',
                  product := __new__.product,
                  stock := <std::str>__new__.stock
              });
  };
};
