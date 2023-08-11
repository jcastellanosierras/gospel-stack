CREATE MIGRATION m1cd6c6prboyogr6w7ljkibujyynhqxbdb53sktrdopxlpfsici64a
    ONTO m1zenky6uo3com5lzyh4v7pbzqlqu2ehl4e77eypoqdonqlzi3ryaa
{
  ALTER TYPE client::inventory::Product {
      CREATE PROPERTY is_discontinued: std::bool;
      CREATE PROPERTY is_future_model: std::bool;
  };
};
