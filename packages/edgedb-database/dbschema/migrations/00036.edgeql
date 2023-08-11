CREATE MIGRATION m1uqpm72tv5tupzczvhc6unrymcpdbfqq3zdl2eudupsnphoa3my2q
    ONTO m13u3ifc6ratgkmzyf5qchpcue5o6km256rc3vhnmv4jnb67rogwka
{
  ALTER TYPE category::OwnerCategory {
      CREATE ACCESS POLICY category_insert
          ALLOW INSERT USING (SELECT
              (default::UserPermissons.UP_INSERT IN (GLOBAL default::current_user).category_permissons)
          );
      CREATE ACCESS POLICY category_select
          ALLOW SELECT USING (SELECT
              (default::UserPermissons.UP_SELECT IN (GLOBAL default::current_user).category_permissons)
          );
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING (SELECT
              (default::UserPermissons.UP_DELETE IN (GLOBAL default::current_user).category_permissons)
          );
      CREATE ACCESS POLICY product_update
          ALLOW UPDATE USING (SELECT
              (default::UserPermissons.UP_UPDATE IN (GLOBAL default::current_user).category_permissons)
          );
  };
};
