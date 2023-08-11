CREATE MIGRATION m1ayftz6csb6sfnu4jyy3y4gkyq7oqztvpc3vro4vnnyw745aagokq
    ONTO m1hz3mp3fpv364huusageb3kfpqs4y47vkwlye664d33f57e7eaoza
{
  ALTER TYPE client::orders::PurchaseOrderLine {
      CREATE LINK purchase_order: client::orders::PurchaseOrder;
      ALTER PROPERTY discount {
          CREATE CONSTRAINT std::max_value(1.0);
          CREATE CONSTRAINT std::min_value(0.0);
      };
      ALTER PROPERTY subtotal {
          USING (((.price * .qty) * (1 - .discount)));
      };
  };
};
