CREATE MIGRATION m1o4gfqk2bqltktbmtumtzdjhzhrdvarms2biyt6bdycfz2bm4rs7q
    ONTO m16ekx56fkbla2knkiyeacxperurwlkpsxn4jxdhrb6cv6j7c5de7a
{
  CREATE MODULE b2c IF NOT EXISTS;
  CREATE MODULE b2c::inventory IF NOT EXISTS;
  CREATE MODULE b2c::sales IF NOT EXISTS;
  CREATE MODULE client IF NOT EXISTS;
  CREATE MODULE client::inventory IF NOT EXISTS;
  CREATE ABSTRACT TYPE common::HasCompanyOwnerPrivate {
      CREATE REQUIRED LINK owner: default::Company;
      CREATE ACCESS POLICY owner_has_full_access
          DENY ALL USING (((GLOBAL default::current_user).company.id ?!= .owner.id));
  };
  ALTER TYPE default::Product {
      CREATE PROPERTY ean: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::User {
      CREATE MULTI PROPERTY b2b_product_permissons: default::UserPermissons;
      CREATE MULTI PROPERTY b2c_product_permissons: default::UserPermissons;
      CREATE MULTI PROPERTY client_product_permissons: default::UserPermissons;
  };
};
