CREATE MIGRATION m1rrs3sqs766j5mvl7jhcur7fr3u4k7d6cjuksg3tyzyh3nw3hp6pq
    ONTO m1bgb2bhmv3tmgngj7xxskd7pulqcttwxmhgsmdhlr3hizl4ueagwq
{
  CREATE TYPE api::product::Brand EXTENDING default::DatedType, default::HasImages, default::HasAvatar {
      CREATE LINK owner: api::account::Account;
      CREATE PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY name: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE REQUIRED PROPERTY reference: std::str;
      CREATE REQUIRED PROPERTY state: api::product::BrandState {
          SET default := 'PENDING_REVIEW';
      };
  };
  CREATE TYPE api::product::Product EXTENDING default::DatedType, default::HasImages {
      CREATE LINK brand: api::product::Brand;
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING (SELECT
              (api::account::UserPermissons.UP_DELETE IN (GLOBAL api::account::current_user).client_product_permissons)
          );
      CREATE ACCESS POLICY product_insert
          ALLOW INSERT USING (SELECT
              (api::account::UserPermissons.UP_INSERT IN (GLOBAL api::account::current_user).client_product_permissons)
          );
      CREATE ACCESS POLICY product_update
          ALLOW UPDATE USING (SELECT
              (api::account::UserPermissons.UP_UPDATE IN (GLOBAL api::account::current_user).client_product_permissons)
          );
      CREATE ACCESS POLICY public_select
          ALLOW SELECT ;
      CREATE ANNOTATION std::description := 'Esta BD de produtos unifica informacion a traves de EAN como codigo unico, que es el codigo identificador\n      universal. El EAN es lo que debe usarse para poder sincronizar aplicaciones y en definitiva para identificar el articulo de forma unica\n      en cualquier aplicacion conectada a esta API.';
      CREATE PROPERTY color: std::str;
      CREATE REQUIRED PROPERTY ean: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY family: std::str;
      CREATE PROPERTY family_code: std::str;
      CREATE PROPERTY is_discontinued: std::bool;
      CREATE PROPERTY is_future_model: std::bool;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY notes: std::str;
      CREATE PROPERTY reference: std::str;
      CREATE PROPERTY sale_price: std::float64;
      CREATE PROPERTY season: std::str;
      CREATE PROPERTY size: std::str;
      CREATE PROPERTY year: std::str;
  };
  CREATE ABSTRACT TYPE api::product::Category EXTENDING default::DatedType, default::HasAvatar, default::HasImages, common::AdminRoleHasFullAccessAccessPolicy {
      CREATE LINK parent: api::product::Category;
      CREATE MULTI LINK children := (.<parent[IS api::product::Category]);
      CREATE REQUIRED PROPERTY level: std::int16 {
          SET default := 0;
      };
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY path: std::str;
      CREATE REQUIRED PROPERTY slug: std::str {
          SET default := (.name);
      };
      CREATE ACCESS POLICY all_can_select
          ALLOW SELECT ;
  };
  CREATE TYPE api::product::GlobalCategory EXTENDING api::product::Category;
  ALTER TYPE api::product::Product {
      CREATE LINK global_category: api::product::GlobalCategory;
  };
};
