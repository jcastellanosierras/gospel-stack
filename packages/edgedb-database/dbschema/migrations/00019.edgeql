CREATE MIGRATION m1mkgt2vhtci5geerzlzjamenrmjqnhbz3jzcffkg6bmufbjjls2qq
    ONTO m1xqxcieisqaxuxwolovvt3qyj64qqen67p5ccwusjie5kzffx44fq
{
  CREATE MODULE category IF NOT EXISTS;
  CREATE ABSTRACT TYPE category::Category EXTENDING default::DatedType, default::HasAvatar, default::HasImages {
      CREATE ACCESS POLICY all_can_select
          ALLOW SELECT USING (SELECT
              (true IF EXISTS ((SELECT
                  default::User FILTER
                      (.id = GLOBAL default::current_user_id)
              LIMIT
                  1
              )) ELSE false)
          );
      CREATE LINK parent: category::Category;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE category::GlobalCategory EXTENDING category::Category {
      CREATE ACCESS POLICY superadmin_has_full_access
          ALLOW ALL USING (((GLOBAL default::current_user).user_role ?= default::AvailableRole.SUPERADMIN));
  };
  CREATE TYPE category::OwnerCategory EXTENDING category::Category {
      CREATE ACCESS POLICY admin_has_full_access
          ALLOW ALL USING (((GLOBAL default::current_user).user_role ?= default::AvailableRole.ADMIN));
  };
};
