CREATE MIGRATION m15jyib4a62xqcmm6unmijrqzlskxtbps2ixm57t4goac5rh6ov57q
    ONTO m1jd426eniuhuum4vgc3hcl3shns4br4wlxkyyzi6gc7ekt66bog2a
{
  CREATE TYPE b2c::inventory::SupplierStock {
      CREATE LINK company: default::Company;
      CREATE LINK product: b2c::inventory::Product;
      CREATE CONSTRAINT std::exclusive ON ((.company, .product));
      CREATE REQUIRED PROPERTY stock: std::float64 {
          CREATE CONSTRAINT std::min_value(0);
      };
  };
  CREATE TYPE b2c::inventory::SupplierStockLog {
      CREATE REQUIRED LINK product: default::Product;
      CREATE REQUIRED LINK user: default::User;
      CREATE REQUIRED PROPERTY action: std::str;
      CREATE REQUIRED PROPERTY stock: std::float64;
      CREATE PROPERTY timestamp: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
      };
  };
};
