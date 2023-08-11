CREATE MIGRATION m1lvicnbqcjqcmdppdqai63bbwehxxbwhjnz3547sa6zaql466fs5q
    ONTO m16ekfio67z2zgkyjtz74f3vsw6liesxo3kewbi66utbw3nn7gh4vq
{
  ALTER TYPE client::inventory::Product {
      DROP PROPERTY count_suppliers;
  };
  ALTER TYPE client::inventory::Product {
      ALTER LINK stock {
          RENAME TO suppliers;
      };
  };
  ALTER TYPE client::inventory::Product {
      CREATE LINK active_suppliers := (SELECT
          .suppliers
      FILTER
          (.stock > 0)
      );
  };
};
