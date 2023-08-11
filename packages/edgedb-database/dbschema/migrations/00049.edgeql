CREATE MIGRATION m1hz3mp3fpv364huusageb3kfpqs4y47vkwlye664d33f57e7eaoza
    ONTO m1qm2dj34725tmlqsusoaltgegegyfd5plxkiwx2abd2nmydpwkvaq
{
  CREATE MODULE client::orders IF NOT EXISTS;
  CREATE ABSTRACT TYPE common::HasUserOwnerPrivate {
      CREATE REQUIRED LINK owner: default::User;
      CREATE ACCESS POLICY owner_has_full_access
          DENY ALL USING ((GLOBAL default::current_user_id ?!= .owner.id));
  };
  CREATE TYPE client::orders::PurchaseOrder EXTENDING default::DatedType, common::HasUserOwnerPrivate {
      CREATE PROPERTY name: std::str;
  };
  CREATE TYPE client::orders::PurchaseOrderLine EXTENDING default::DatedType, common::HasUserOwnerPrivate {
      CREATE LINK product: client::inventory::Product;
      CREATE PROPERTY discount: std::float64;
      CREATE PROPERTY price: std::float64;
      CREATE PROPERTY qty: std::float64;
      CREATE PROPERTY subtotal := (((.price * .qty) * .discount));
      CREATE PROPERTY name: std::str;
  };
  ALTER TYPE client::orders::PurchaseOrder {
      CREATE MULTI LINK purchase_order_lines: client::orders::PurchaseOrderLine;
  };
};
