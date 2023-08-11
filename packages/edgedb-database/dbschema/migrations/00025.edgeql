CREATE MIGRATION m1qnyadmtktohyb4rwvycjvqwv3uh3b7tgff5qrce2cwepc4bpjf6a
    ONTO m1ixbtnqh4fhmvryenf3iydv6up3vifi4uend7lckac7py7axrwqta
{
  CREATE MODULE common IF NOT EXISTS;
  CREATE ABSTRACT TYPE common::AdminRoleHasFullAccess {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING ((((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN) OR ((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN)));
  };
  CREATE ABSTRACT TYPE common::HasCompanyOwner {
      CREATE REQUIRED LINK owner: default::Company;
      CREATE ACCESS POLICY owner_has_full_access
          ALLOW ALL USING ((GLOBAL default::current_user_id ?= .owner.id));
  };
  CREATE ABSTRACT TYPE common::HasUserOwner {
      CREATE REQUIRED LINK owner: default::User;
      CREATE ACCESS POLICY owner_has_full_access
          ALLOW ALL USING ((GLOBAL default::current_user_id ?= .owner.id));
  };
  CREATE SCALAR TYPE default::UserPermissons EXTENDING enum<`select`, `insert`, `delete`, `update`>;
  ALTER TYPE default::User {
      CREATE MULTI PROPERTY category_permissons: default::UserPermissons;
  };
};
