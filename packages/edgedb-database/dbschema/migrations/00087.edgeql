CREATE MIGRATION m15yhr6wsguwqm6wm7lgfcmypo4piqqr6knzik5pg4sxwxxyzb7yeq
    ONTO m1wziq7jylqguk2cmoxcj7nuejvtdmmvp2v4kqeuixehb3hki5nwgq
{
  ALTER TYPE api::product::Product {
      ALTER ACCESS POLICY product_insert USING ((api::account::UserPermissons.UP_INSERT IN (GLOBAL default::api_current_user).client_product_permissons));
      CREATE ACCESS POLICY product_insert_if_owner
          ALLOW INSERT USING ((GLOBAL default::current_account_id ?= .owner.id));
  };
};
