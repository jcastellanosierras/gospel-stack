CREATE MIGRATION m13nypkav2nqzvzzswfyknvseuecfhcua7vhkyiruiafefc2pcp5pa
    ONTO m15yhr6wsguwqm6wm7lgfcmypo4piqqr6knzik5pg4sxwxxyzb7yeq
{
  ALTER TYPE api::product::Product {
      ALTER ACCESS POLICY deny_all_except_owner_and_admin USING (std::all({((GLOBAL default::api_current_user).account.id ?!= .owner.id), (GLOBAL default::current_account_id ?!= .owner.id), ((GLOBAL default::api_current_user).user_role ?!= api::account::AvailableRole.ADMIN)}));
  };
};
