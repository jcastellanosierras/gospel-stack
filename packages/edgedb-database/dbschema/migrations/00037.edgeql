CREATE MIGRATION m1ojg3iczitc7n3revl6q7t7sgyr5mn4z5ykmlhrizmmcat4nmfpta
    ONTO m1uqpm72tv5tupzczvhc6unrymcpdbfqq3zdl2eudupsnphoa3my2q
{
  ALTER TYPE common::HasCompanyOwner {
      ALTER ACCESS POLICY owner_has_full_access DENY UPDATE, DELETE;
  };
};
