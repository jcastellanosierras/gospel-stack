CREATE MIGRATION m1wziq7jylqguk2cmoxcj7nuejvtdmmvp2v4kqeuixehb3hki5nwgq
    ONTO m1urfvo4scjsjowt3li63evysphvewwecthhtjzxv4hw46vo3fmqtq
{
  ALTER TYPE api::product::Product {
      ALTER ACCESS POLICY product_insert USING (std::any({(api::account::UserPermissons.UP_INSERT IN (GLOBAL default::api_current_user).client_product_permissons), (GLOBAL default::current_account_id ?= .owner.id)}));
  };
};
