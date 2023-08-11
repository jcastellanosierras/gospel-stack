CREATE MIGRATION m1pbiu5cchsol72xqz3z7a6uvljoxkh2wv7drv43lhhbonaofdyhla
    ONTO m1iyn74itjrjdpolfhb32ofvymbfb22l5z3z6dg2zvkrucwoeau6gq
{
  ALTER TYPE client::inventory::Product {
      DROP ACCESS POLICY product_delete;
      DROP ACCESS POLICY product_insert;
      DROP ACCESS POLICY product_update;
      DROP ACCESS POLICY public_select;
      DROP ANNOTATION std::description;
      DROP LINK active_suppliers;
      DROP LINK brand;
      DROP LINK global_category;
      DROP LINK owner_category;
      DROP LINK suppliers;
      DROP PROPERTY color;
      DROP PROPERTY ean;
      DROP PROPERTY family;
      DROP PROPERTY family_code;
      DROP PROPERTY is_discontinued;
      DROP PROPERTY is_future_model;
      DROP PROPERTY name;
      DROP PROPERTY notes;
      DROP PROPERTY reference;
      DROP PROPERTY sale_price;
      DROP PROPERTY season;
      DROP PROPERTY size;
      DROP PROPERTY year;
  };
  DROP TYPE client::inventory::SupplierStock;
  ALTER TYPE client::orders::PurchaseOrderLine {
      DROP LINK product;
  };
  DROP TYPE client::inventory::Product;
  ALTER TYPE client::orders::PurchaseOrderLine {
      CREATE PROPERTY product: std::str;
  };
  DROP MODULE client::inventory;
};
