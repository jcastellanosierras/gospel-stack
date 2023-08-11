CREATE MIGRATION m1urfvo4scjsjowt3li63evysphvewwecthhtjzxv4hw46vo3fmqtq
    ONTO m1yvnjpg4fbz5kejvtrdqdgulqrlpxxybvmz6oort3nr2qfs7uq33q
{
  ALTER TYPE api::product::Product {
      ALTER ACCESS POLICY deny_all_except_owner_and_admin USING (std::any({((GLOBAL default::api_current_user).account.id ?!= .owner.id), (GLOBAL default::current_account_id ?!= .owner.id), ((GLOBAL default::api_current_user).user_role ?!= api::account::AvailableRole.ADMIN)}));
  };
};
