CREATE MIGRATION m1mkyoecw4pea7qxzv6n6jdftfpnmoqwvujaewd3zqpcewars7a2wq
    ONTO m1mkgt2vhtci5geerzlzjamenrmjqnhbz3jzcffkg6bmufbjjls2qq
{
  ALTER TYPE category::OwnerCategory {
      ALTER ACCESS POLICY admin_has_full_access USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
  };
};
