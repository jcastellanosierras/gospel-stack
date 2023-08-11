CREATE MIGRATION m16ekx56fkbla2knkiyeacxperurwlkpsxn4jxdhrb6cv6j7c5de7a
    ONTO m1ojg3iczitc7n3revl6q7t7sgyr5mn4z5ykmlhrizmmcat4nmfpta
{
  ALTER TYPE common::HasCompanyOwner {
      ALTER ACCESS POLICY owner_has_full_access {
          DENY UPDATE, DELETE, INSERT;
          USING (((((GLOBAL default::current_user).company.id ?!= .owner.id) AND ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.SUPERADMIN)) AND ((GLOBAL default::current_user).user_role ?!= default::AvailableRole.ADMIN)));
      };
  };
};
