CREATE MIGRATION m1ixbtnqh4fhmvryenf3iydv6up3vifi4uend7lckac7py7axrwqta
    ONTO m16c6q7py2wxatgptfu7alba25ozliiu4qndpnwgcar5q63zsnciuq
{
  ALTER TYPE category::Category {
      CREATE MULTI LINK children: category::Category;
  };
  ALTER TYPE category::Category {
      CREATE MULTI LINK parents := (.<children[IS category::Category]);
  };
  ALTER TYPE category::Category {
      CREATE MULTI LINK ancestors := (SELECT
          (((.parents UNION .parents.parents) UNION .parents.parents.parents) UNION .parents.parents.parents.parents)
      );
  };
  ALTER TYPE category::Category {
      CREATE PROPERTY level := (std::count(.ancestors));
  };
  ALTER TYPE category::Category {
      DROP LINK parent;
  };
};
