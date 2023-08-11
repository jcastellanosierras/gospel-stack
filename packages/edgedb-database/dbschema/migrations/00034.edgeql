CREATE MIGRATION m1jfjilgl7ueui565ha7yccbf6garxpxpdwnhyqmnsn425m377ymjq
    ONTO m173rsf4gywm7j4wd4cetbhp367giug2olydskiczisuropdcow6oa
{
  ALTER TYPE category::Category {
      CREATE MULTI LINK children := (.<parent[IS category::Category]);
      CREATE REQUIRED PROPERTY slug: std::str {
          SET default := (.name);
      };
  };
  ALTER TYPE category::OwnerCategory {
      ALTER ACCESS POLICY category_insert ALLOW INSERT;
      ALTER ACCESS POLICY product_update ALLOW UPDATE;
  };
};
