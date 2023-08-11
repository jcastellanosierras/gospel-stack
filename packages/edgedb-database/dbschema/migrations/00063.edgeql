CREATE MIGRATION m1wcozroq2vtc3uwop4dbepkcohqizpg7damjycc35fujuqiklj3wq
    ONTO m1riri4lltlhtmteqooo4h67gpmx5crpuwi4ep3taqoy7lrp7fxrea
{
  ALTER TYPE client::inventory::SupplierStock {
      CREATE REQUIRED LINK product: client::inventory::Product {
          SET REQUIRED USING (<client::inventory::Product>{});
      };
  };
  ALTER TYPE client::inventory::Product {
      ALTER LINK stock {
          USING (.<product[IS client::inventory::SupplierStock]);
      };
  };
  ALTER TYPE client::inventory::SupplierStock {
      DROP CONSTRAINT std::exclusive ON ((.company, .ean));
  };
  ALTER TYPE client::inventory::SupplierStock {
      CREATE CONSTRAINT std::exclusive ON ((.company, .product));
      DROP INDEX ON ((__subject__.company, __subject__.ean));
      DROP PROPERTY ean;
  };
};
