CREATE MIGRATION m1yfszqshdlfwyiaccsxlp4bmgr3i4dwwdcgrntyw3347ffxgfhnyq
    ONTO m1wamyou2z3bb2zik3mjzyduxkttz7nfikmm6xojyegctd6ptuynoa
{
  ALTER TYPE client::inventory::Product {
      CREATE LINK stock := (SELECT
          client::inventory::SupplierStock
      FILTER
          (.ean = (DETACHED client::inventory::Product).ean)
      );
  };
  ALTER TYPE client::inventory::SupplierStock {
      CREATE REQUIRED LINK product: client::inventory::Product {
          SET REQUIRED USING (<client::inventory::Product>{});
      };
  };
};
