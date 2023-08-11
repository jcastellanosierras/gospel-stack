CREATE MIGRATION m1yvnjpg4fbz5kejvtrdqdgulqrlpxxybvmz6oort3nr2qfs7uq33q
    ONTO m1tgdft34x7zkeyhabnuikol2ulkjk6ee6ezknrf43ujgqbsvfmm4a
{
  DROP GLOBAL default::api_current_apikey;
  ALTER GLOBAL default::current_apikey_id RENAME TO default::current_account_id;
  CREATE GLOBAL default::api_current_account := (SELECT
      api::account::Account
  FILTER
      (.id = GLOBAL default::current_account_id)
  );
  ALTER TYPE api::product::Product {
      CREATE ACCESS POLICY deny_all_except_owner_and_admin
          DENY UPDATE, DELETE, INSERT USING (((((GLOBAL default::api_current_user).account.id ?!= .owner.id) AND (GLOBAL default::current_account_id ?!= .owner.id)) AND ((GLOBAL default::api_current_user).user_role ?!= api::account::AvailableRole.ADMIN)));
  };
};
