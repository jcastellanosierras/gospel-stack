CREATE MIGRATION m1fgyksxjbmwkcmxwtfgobhn3ohjkfb7sez7x32bendeu6ev7ppzrq
    ONTO m1gc7xzwdrz3fwx4dtl2eqouderaegjog6jhkrrkueouz2nohfzpga
{
  CREATE TYPE b2c::sales::SaleOrder EXTENDING default::DatedType, common::HasCompanyOwnerPrivate {
      CREATE PROPERTY name: std::str;
  };
  CREATE TYPE b2c::sales::SaleOrderLine EXTENDING default::DatedType, common::HasCompanyOwnerPrivate {
      CREATE LINK product: b2c::inventory::Product;
      CREATE PROPERTY discount: std::float64;
      CREATE PROPERTY price: std::float64;
      CREATE PROPERTY qty: std::float64;
      CREATE PROPERTY subtotal := (((.price * .qty) * .discount));
      CREATE PROPERTY name: std::str;
  };
  ALTER TYPE b2c::sales::SaleOrder {
      CREATE MULTI LINK sale_order_lines: b2c::sales::SaleOrderLine;
  };
};
