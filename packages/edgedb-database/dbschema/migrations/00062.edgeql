CREATE MIGRATION m1riri4lltlhtmteqooo4h67gpmx5crpuwi4ep3taqoy7lrp7fxrea
    ONTO m1yfszqshdlfwyiaccsxlp4bmgr3i4dwwdcgrntyw3347ffxgfhnyq
{
  ALTER TYPE client::inventory::SupplierStock {
      DROP LINK product;
  };
};
