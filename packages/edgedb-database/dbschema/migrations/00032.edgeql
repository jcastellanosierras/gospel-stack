CREATE MIGRATION m1ylig43pouithmr6aw5gjxl5eokeklu3omw7b5luqtdycqswgr2fq
    ONTO m16u5dlkugvq55l6okfbw4etwj4opaa53rofwgr6aswap2bucxnpba
{
  ALTER TYPE category::Category {
      DROP PROPERTY level;
  };
  ALTER TYPE category::Category {
      DROP LINK parents;
  };
  ALTER TYPE category::Category {
      DROP LINK children;
  };
  ALTER TYPE category::Category {
      CREATE LINK parent: category::Category;
  };
  ALTER TYPE category::Category {
      CREATE PROPERTY path: std::str;
  };
};
