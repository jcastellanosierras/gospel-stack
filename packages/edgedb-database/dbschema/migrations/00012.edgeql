CREATE MIGRATION m1cxudpcdz4ycx3g7p4opjxhqugqusli52clrxrmhanhecybl7h4za
    ONTO m1hs2rpt6v4o5wz63gpv4b6moqp6yfdmwcsco725i7uhifpri4mvfa
{
  CREATE GLOBAL default::current_user_id -> std::uuid;
  CREATE GLOBAL default::current_user := (SELECT
      default::User
  FILTER
      (.id = GLOBAL default::current_user_id)
  );
  ALTER TYPE default::Company {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
      CREATE ACCESS POLICY rest_can_select
          ALLOW SELECT USING (SELECT
              true
          );
  };
  ALTER TYPE default::Product {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
      CREATE ACCESS POLICY user_from_company_has_full_access
          ALLOW ALL USING (((GLOBAL default::current_user).company ?= .owner));
  };
  ALTER TYPE default::User {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
      CREATE ACCESS POLICY user_can_update
          ALLOW SELECT, UPDATE USING ((GLOBAL default::current_user_id ?= .id));
  };
  ALTER TYPE default::Password {
      CREATE ACCESS POLICY only_superadmin_has_access
          ALLOW ALL USING (((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN));
      CREATE ACCESS POLICY user_can_select_and_update
          ALLOW SELECT, UPDATE USING ((GLOBAL default::current_user ?= .user));
  };
  ALTER TYPE default::Session {
      CREATE ACCESS POLICY only_superadmin_has_access
          ALLOW ALL USING (((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN));
      CREATE ACCESS POLICY user_can_create
          ALLOW INSERT USING (((GLOBAL default::current_user).id ?= .user.id));
  };
  ALTER TYPE default::Verification {
      CREATE ACCESS POLICY only_superadmin_has_access
          ALLOW ALL USING (((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN));
  };
};
