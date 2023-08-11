CREATE MIGRATION m16ekfio67z2zgkyjtz74f3vsw6liesxo3kewbi66utbw3nn7gh4vq
    ONTO m1lyriyaeowiqvnrdah4t5aeh2exfmzo2mzdfvoin3dy2oizlmxbua
{
  ALTER TYPE client::inventory::Product {
      CREATE PROPERTY count_suppliers: std::int16 {
          CREATE REWRITE
              INSERT 
              USING (std::count(.stock));
          CREATE REWRITE
              UPDATE 
              USING (std::count(.stock));
      };
  };
};
