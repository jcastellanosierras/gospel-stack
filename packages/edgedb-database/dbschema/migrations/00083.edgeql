CREATE MIGRATION m1tgdft34x7zkeyhabnuikol2ulkjk6ee6ezknrf43ujgqbsvfmm4a
    ONTO m144drjpfljazkybxbovo7rsl4kg4pcf2essxr3obfu6hbfq7lzvqa
{
  CREATE GLOBAL default::current_apikey_id -> std::uuid;
  CREATE SCALAR TYPE api::account::ApiPermissons EXTENDING enum<API_SELECT, API_INSERT, API_UPDATE, API_DELETE>;
  ALTER TYPE api::account::ApiKey {
      CREATE MULTI PROPERTY permissons: api::account::ApiPermissons;
  };
  CREATE GLOBAL default::api_current_apikey := (SELECT
      api::account::ApiKey
  FILTER
      (.id = GLOBAL default::current_apikey_id)
  );
  ALTER TYPE api::product::Product {
      ALTER ACCESS POLICY product_insert USING ((api::account::UserPermissons.UP_INSERT IN (GLOBAL default::api_current_user).client_product_permissons));
      CREATE LINK owner: api::account::Account;
  };
};
