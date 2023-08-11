CREATE MIGRATION m1wspeww5pwq6ugv54p6exgsgvcazjqf7rk6amogsxfpnd6yyv2xeq
    ONTO m1mkyoecw4pea7qxzv6n6jdftfpnmoqwvujaewd3zqpcewars7a2wq
{
  ALTER TYPE category::GlobalCategory {
      ALTER ACCESS POLICY superadmin_has_full_access USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
  };
  ALTER TYPE category::OwnerCategory {
      CREATE REQUIRED LINK owner: default::User {
          SET REQUIRED USING (<default::User>{});
      };
      ALTER ACCESS POLICY admin_has_full_access USING (((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)) OR ((GLOBAL default::current_user).company ?= .owner)));
  };
};
