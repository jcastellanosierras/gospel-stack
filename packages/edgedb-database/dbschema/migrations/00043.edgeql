CREATE MIGRATION m1xqfxby7eoqmmguwiyjazulp6gfzpzrqftmnnoxccyxmo63wdlkea
    ONTO m14jtwtgkxopp3qbfs2hx5eg34wvkhjpahyp3qey4vnma53q7p4g2q
{
  ALTER TYPE b2c::inventory::SupplierStockLog {
      ALTER LINK product {
          SET TYPE b2c::inventory::Product USING (.product[IS b2c::inventory::Product]);
      };
  };
};
