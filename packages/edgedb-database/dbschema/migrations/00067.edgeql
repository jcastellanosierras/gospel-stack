CREATE MIGRATION m1rcy4u2y5d4hyhqsnwzjwpuvrtbympn6nnryleat2eqh6v2dd6k6q
    ONTO m1lvicnbqcjqcmdppdqai63bbwehxxbwhjnz3547sa6zaql466fs5q
{
  ALTER TYPE b2c::inventory::Stock {
      CREATE CONSTRAINT std::exclusive ON (.product);
  };
  ALTER TYPE b2c::inventory::Stock {
      DROP CONSTRAINT std::exclusive ON ((.company, .product));
      DROP LINK company;
  };
};
