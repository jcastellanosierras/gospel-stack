CREATE MIGRATION m1n5m463nal4wjgllh5hkvzncrkpyaddmxqjnu76qwi3ekcigm542q
    ONTO m1plnoxqr33w6iv6xu6dhrftnetvllylkanngl3aqcsmshfcvk7woa
{
  ALTER TYPE b2c::inventory::SupplierStock {
      CREATE TRIGGER log_stock_modifications
          AFTER INSERT 
          FOR EACH DO (INSERT
              b2c::inventory::SupplierStockLog
              {
                  action := 'insert',
                  product := __new__.product,
                  stock := <std::str>__new__.stock
              });
  };
};
