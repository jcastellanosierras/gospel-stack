CREATE MIGRATION m1ppfy4m32xwxmzsyrn5ophvfz6bv3in7ktdjj7nr3pkkfyukemeqa
    ONTO m1dzf26axgysyelsua52oxlmdkevycqiptmklzmp5q4kdnctqfksqq
{
  ALTER TYPE category::OwnerCategory {
      CREATE ACCESS POLICY category_insert
          ALLOW SELECT USING ((<default::UserPermissons>'insert' IN (GLOBAL default::current_user).category_permissons));
      CREATE ACCESS POLICY category_select
          ALLOW SELECT USING ((<default::UserPermissons>'select' IN (GLOBAL default::current_user).category_permissons));
      CREATE ACCESS POLICY product_delete
          ALLOW DELETE USING ((<default::UserPermissons>'delete' IN (GLOBAL default::current_user).category_permissons));
      CREATE ACCESS POLICY product_update
          ALLOW DELETE USING ((<default::UserPermissons>'update' IN (GLOBAL default::current_user).category_permissons));
  };
  ALTER TYPE common::HasCompanyOwner {
      ALTER ACCESS POLICY owner_has_full_access {
          DENY UPDATE, DELETE, INSERT;
          USING (((((GLOBAL default::current_user).company.id ?!= .owner.id) OR ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.SUPERADMIN)) OR ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.ADMIN)));
      };
  };
  ALTER TYPE common::HasUserOwner {
      ALTER ACCESS POLICY owner_has_full_access {
          DENY UPDATE, DELETE, INSERT;
          USING ((((GLOBAL default::current_user_id ?!= .owner.id) OR ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.SUPERADMIN)) OR ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.ADMIN)));
      };
  };
};
