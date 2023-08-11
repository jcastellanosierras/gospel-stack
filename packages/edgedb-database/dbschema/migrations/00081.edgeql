CREATE MIGRATION m1vfxwaqrpvpfm55c6smygqqtgj53f6yuzv2r7xdlggljhevjvtfoq
    ONTO m1rrs3sqs766j5mvl7jhcur7fr3u4k7d6cjuksg3tyzyh3nw3hp6pq
{
  ALTER TYPE api::account::Account {
      CREATE LINK brands := (.<owner[IS api::product::Brand]);
  };
  CREATE TYPE api::product::OwnerCategory EXTENDING api::product::Category {
      CREATE ACCESS POLICY category_insert
          ALLOW INSERT USING (SELECT
              (api::account::UserPermissons.UP_INSERT IN (GLOBAL api::account::current_user).category_permissons)
          );
      CREATE ACCESS POLICY category_select
          ALLOW SELECT USING (SELECT
              (api::account::UserPermissons.UP_SELECT IN (GLOBAL api::account::current_user).category_permissons)
          );
      CREATE REQUIRED LINK owner: api::account::Account;
      CREATE ACCESS POLICY owner_has_full_access
          DENY UPDATE, DELETE, INSERT USING ((((GLOBAL api::account::current_user).account.id ?!= .owner.id) AND ((GLOBAL api::account::current_user).user_role ?!= api::account::AvailableRole.ADMIN)));
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING (SELECT
              (api::account::UserPermissons.UP_DELETE IN (GLOBAL api::account::current_user).category_permissons)
          );
      CREATE ACCESS POLICY product_update
          ALLOW UPDATE USING (SELECT
              (api::account::UserPermissons.UP_UPDATE IN (GLOBAL api::account::current_user).category_permissons)
          );
  };
  ALTER TYPE api::product::Product {
      CREATE LINK owner_category: api::product::OwnerCategory;
  };
};
