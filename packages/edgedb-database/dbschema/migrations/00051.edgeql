CREATE MIGRATION m1k3e4onljce2zw7xktfy22dt2fnb4icg6eru56m5tt6t4oixdslta
    ONTO m1ayftz6csb6sfnu4jyy3y4gkyq7oqztvpc3vro4vnnyw745aagokq
{
  ALTER TYPE client::orders::PurchaseOrder {
      DROP LINK purchase_order_lines;
  };
};
