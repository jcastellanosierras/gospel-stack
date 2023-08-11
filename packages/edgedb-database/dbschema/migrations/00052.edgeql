CREATE MIGRATION m1vowytxzxauho7ivn523ybfui4ydvivbmrolrlkxsy5hnlimoiqoa
    ONTO m1k3e4onljce2zw7xktfy22dt2fnb4icg6eru56m5tt6t4oixdslta
{
  ALTER TYPE client::inventory::Product {
      ALTER ANNOTATION std::description := 'Esta BD de produtos debe beber de b2b::Product a traves de EAN del articulo, que es el codigo identificador\n      universal. El EAN es lo que debe usarse para poder sincronizar aplicaciones que no esten conectadas directamente a tu sistema, ya que \n      en esas aplicaciones no se tendra ningun otro identificador del articulo que permita relacionar los productos entre si.';
      DROP PROPERTY barcode;
      ALTER PROPERTY ean {
          CREATE CONSTRAINT std::exclusive;
          SET REQUIRED USING (<std::str>{});
      };
  };
  ALTER TYPE client::inventory::SupplierStock {
      CREATE REQUIRED PROPERTY ean: std::str {
          SET REQUIRED USING (<std::str>{});
      };
  };
  ALTER TYPE client::inventory::SupplierStock {
      CREATE CONSTRAINT std::exclusive ON ((.company, .ean));
  };
  ALTER TYPE client::inventory::SupplierStock {
      DROP CONSTRAINT std::exclusive ON ((.company, .product));
      CREATE INDEX ON ((__subject__.company, __subject__.ean));
      DROP LINK product;
  };
};
