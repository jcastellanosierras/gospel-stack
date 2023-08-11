CREATE MIGRATION m1q2rgq2jcd2k5fiw27icxb6tqg4d7gbczl76jjuj2gyoewbnghrtq
    ONTO m1w7mp6yolqc3sllvcfgqgyeqcjjcwtca5efeezrcnm6d22uwdsoaq
{
  ALTER TYPE b2c::inventory::Stock {
      ALTER LINK product {
          SET REQUIRED USING (<b2c::inventory::Product>{});
      };
  };
};
