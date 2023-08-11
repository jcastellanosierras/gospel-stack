CREATE MIGRATION m1qm2dj34725tmlqsusoaltgegegyfd5plxkiwx2abd2nmydpwkvaq
    ONTO m1fgyksxjbmwkcmxwtfgobhn3ohjkfb7sez7x32bendeu6ev7ppzrq
{
  CREATE TYPE client::inventory::Product EXTENDING default::DatedType, default::HasImages {
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING (SELECT
              (default::UserPermissons.UP_DELETE IN (GLOBAL default::current_user).client_product_permissons)
          );
      CREATE ACCESS POLICY product_insert
          ALLOW INSERT USING (SELECT
              (default::UserPermissons.UP_INSERT IN (GLOBAL default::current_user).client_product_permissons)
          );
      CREATE ACCESS POLICY product_update
          ALLOW UPDATE USING (SELECT
              (default::UserPermissons.UP_UPDATE IN (GLOBAL default::current_user).client_product_permissons)
          );
      CREATE ANNOTATION std::description := 'Esta BD de produtos debe beber de b2c::Product a traves de EAN del articulo, que es el codigo identificador\n      universal. El EAN es lo que debe usarse para poder sincronizar aplicaciones que no esten conectadas directamente a tu sistema, ya que \n      en esas aplicaciones no se tendra ningun otro identificador del articulo que permita relacionar los productos entre si.';
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
      CREATE REQUIRED PROPERTY reference: std::str;
      CREATE PROPERTY sale_price: std::float64;
      CREATE PROPERTY season: std::str;
      CREATE PROPERTY size: std::str;
      CREATE PROPERTY year: std::str;
  };
  CREATE TYPE client::inventory::SupplierStock {
      CREATE REQUIRED LINK company: default::Company;
      CREATE REQUIRED LINK product: client::inventory::Product;
      CREATE CONSTRAINT std::exclusive ON ((.company, .product));
      CREATE REQUIRED PROPERTY stock: std::float64 {
          CREATE CONSTRAINT std::min_value(0);
      };
  };
};
