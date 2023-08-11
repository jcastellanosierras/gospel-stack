CREATE MIGRATION m1bgb2bhmv3tmgngj7xxskd7pulqcttwxmhgsmdhlr3hizl4ueagwq
    ONTO m1cd6c6prboyogr6w7ljkibujyynhqxbdb53sktrdopxlpfsici64a
{
  CREATE MODULE api IF NOT EXISTS;
  CREATE MODULE api::account IF NOT EXISTS;
  CREATE MODULE api::product IF NOT EXISTS;
  CREATE TYPE api::account::ApiKey EXTENDING default::DatedType {
      CREATE REQUIRED PROPERTY key: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  CREATE TYPE api::account::Account EXTENDING default::DatedType, default::HasAvatar {
      CREATE MULTI LINK api_keys: api::account::ApiKey;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE SCALAR TYPE api::account::AvailableRole EXTENDING enum<ADMIN, USER>;
  CREATE SCALAR TYPE api::account::UserPermissons EXTENDING enum<UP_SELECT, UP_INSERT, UP_UPDATE, UP_DELETE>;
  CREATE TYPE api::account::User EXTENDING default::DatedType, default::HasAvatar {
      CREATE LINK account: api::account::Account;
      CREATE PROPERTY active: std::bool;
      CREATE MULTI PROPERTY b2b_product_permissons: api::account::UserPermissons;
      CREATE MULTI PROPERTY b2c_product_permissons: api::account::UserPermissons;
      CREATE MULTI PROPERTY category_permissons: api::account::UserPermissons;
      CREATE MULTI PROPERTY client_product_permissons: api::account::UserPermissons;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY user_role: api::account::AvailableRole {
          SET default := 'USER';
      };
      CREATE REQUIRED PROPERTY username: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE ACCESS POLICY user_can_update
          ALLOW SELECT, UPDATE USING ((GLOBAL default::current_user_id ?= .id));
  };
  CREATE TYPE api::account::Session EXTENDING default::DatedType {
      CREATE REQUIRED LINK user: api::account::User;
      CREATE REQUIRED PROPERTY expires_at: std::datetime;
  };
  ALTER TYPE api::account::User {
      CREATE LINK sessions := (.<user[IS api::account::Session]);
  };
  CREATE GLOBAL api::account::current_user := (SELECT
      api::account::User
  FILTER
      (.id = GLOBAL default::current_user_id)
  );
  ALTER TYPE api::account::User {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING (((GLOBAL api::account::current_user).user_role ?= api::account::AvailableRole.ADMIN));
  };
  CREATE TYPE api::account::Password EXTENDING default::DatedType {
      CREATE ACCESS POLICY only_admin_has_access
          ALLOW ALL USING (((GLOBAL api::account::current_user).user_role ?= api::account::AvailableRole.ADMIN));
      CREATE REQUIRED PROPERTY hash: std::str;
  };
  ALTER TYPE api::account::Session {
      CREATE ACCESS POLICY only_admin_has_access
          ALLOW ALL USING (((GLOBAL api::account::current_user).user_role ?= api::account::AvailableRole.ADMIN));
      CREATE ACCESS POLICY user_can_select_and_create
          ALLOW SELECT, INSERT USING (((GLOBAL api::account::current_user).id ?= .user.id));
  };
  CREATE SCALAR TYPE api::account::VerificationType EXTENDING enum<ONBOARDING, TWOFA, TWOFA_PENDING, FORGOT_PASSWORD>;
  CREATE TYPE api::account::Verification EXTENDING default::DatedType {
      CREATE ACCESS POLICY only_admin_has_access
          ALLOW ALL USING (((GLOBAL api::account::current_user).user_role ?= api::account::AvailableRole.ADMIN));
      CREATE REQUIRED PROPERTY ttarget: std::str;
      CREATE REQUIRED PROPERTY ttype: api::account::VerificationType;
      CREATE CONSTRAINT std::exclusive ON ((.ttarget, .ttype));
      CREATE REQUIRED PROPERTY algorithm: std::str;
      CREATE REQUIRED PROPERTY period: std::int64;
      CREATE PROPERTY expires_at := ((.created_at + <std::duration>(<std::str>.period ++ ' seconds')));
      CREATE REQUIRED PROPERTY digits: std::int64;
      CREATE REQUIRED PROPERTY secret: std::str;
  };
  ALTER TYPE api::account::User {
      CREATE REQUIRED LINK password: api::account::Password {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE api::account::Password {
      CREATE LINK user := (.<password[IS api::account::User]);
      CREATE ACCESS POLICY user_can_select_and_update
          ALLOW SELECT, UPDATE USING ((GLOBAL api::account::current_user ?= .user));
  };
  CREATE SCALAR TYPE api::product::BrandState EXTENDING enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  CREATE SCALAR TYPE api::product::ProductState EXTENDING enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
};
