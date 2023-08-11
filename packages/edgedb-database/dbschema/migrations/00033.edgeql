CREATE MIGRATION m173rsf4gywm7j4wd4cetbhp367giug2olydskiczisuropdcow6oa
    ONTO m1ylig43pouithmr6aw5gjxl5eokeklu3omw7b5luqtdycqswgr2fq
{
  ALTER TYPE category::Category {
      CREATE REQUIRED PROPERTY level: std::int16 {
          SET default := 0;
      };
  };
};
