CREATE MIGRATION m1jd426eniuhuum4vgc3hcl3shns4br4wlxkyyzi6gc7ekt66bog2a
    ONTO m1o4gfqk2bqltktbmtumtzdjhzhrdvarms2biyt6bdycfz2bm4rs7q
{
  CREATE TYPE b2c::inventory::Product EXTENDING default::DatedType, default::HasImages, common::HasCompanyOwnerPrivate {
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING (SELECT
              (default::UserPermissons.UP_DELETE IN (GLOBAL default::current_user).b2c_product_permissons)
          );
      CREATE ACCESS POLICY product_insert
          ALLOW INSERT USING (SELECT
              (default::UserPermissons.UP_INSERT IN (GLOBAL default::current_user).b2c_product_permissons)
          );
      CREATE ACCESS POLICY product_select
          ALLOW SELECT USING (SELECT
              (default::UserPermissons.UP_SELECT IN (GLOBAL default::current_user).b2c_product_permissons)
          );
      CREATE ACCESS POLICY product_update
          ALLOW UPDATE USING (SELECT
              (default::UserPermissons.UP_UPDATE IN (GLOBAL default::current_user).b2c_product_permissons)
          );
      CREATE LINK brand: default::Brand;
      CREATE LINK global_category: category::GlobalCategory;
      CREATE LINK owner_category: category::OwnerCategory;
      CREATE PROPERTY barcode: std::str;
      CREATE PROPERTY color: std::str;
      CREATE PROPERTY ean: std::str;
      CREATE PROPERTY family: std::str;
      CREATE PROPERTY family_code: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY notes: std::str;
      CREATE PROPERTY reference: std::str;
      CREATE PROPERTY sale_price: std::float64;
      CREATE PROPERTY season: std::str;
      CREATE PROPERTY size: std::str;
      CREATE PROPERTY year: std::str;
  };
};
