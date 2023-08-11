CREATE MIGRATION m1cykqznpzrws6ixv4jzjupejf3cawouwmjvy2avt445ynzflundda
    ONTO m1q2rgq2jcd2k5fiw27icxb6tqg4d7gbczl76jjuj2gyoewbnghrtq
{
  ALTER TYPE client::inventory::SupplierStock {
      ALTER PROPERTY stock {
          RENAME TO quantity;
      };
  };
};
