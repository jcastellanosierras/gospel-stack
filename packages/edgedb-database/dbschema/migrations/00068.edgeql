CREATE MIGRATION m1w7mp6yolqc3sllvcfgqgyeqcjjcwtca5efeezrcnm6d22uwdsoaq
    ONTO m1rcy4u2y5d4hyhqsnwzjwpuvrtbympn6nnryleat2eqh6v2dd6k6q
{
  ALTER TYPE client::inventory::SupplierStock EXTENDING default::DatedType LAST;
  ALTER TYPE default::DatedType {
      ALTER PROPERTY updated_at {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
          CREATE REWRITE
              UPDATE 
              USING (std::datetime_of_statement());
      };
  };
};
