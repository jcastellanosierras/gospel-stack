CREATE MIGRATION m1ynq4nt2x4cnwa7tf53tog54dullezudhmytsfbhvg7ski5k2zrna
    ONTO m1koctgouwvi52l7gm3wvwz7xsjff2cf26asabztla6iao6qq3qtiq
{
  CREATE TYPE b2c::inventory::Stock {
      CREATE LINK company: default::Company;
      CREATE LINK product: b2c::inventory::Product;
      CREATE CONSTRAINT std::exclusive ON ((.company, .product));
      CREATE REQUIRED PROPERTY stock: std::float64 {
          CREATE CONSTRAINT std::min_value(0);
      };
      CREATE TRIGGER log_stock_modifications
          AFTER INSERT 
          FOR EACH DO (INSERT
              b2c::inventory::SupplierStockLog
              {
                  action := 'insert',
                  product := __new__.product,
                  stock := <std::str>__new__.stock
              });
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
  DROP TYPE b2c::inventory::SupplierStock;
};
