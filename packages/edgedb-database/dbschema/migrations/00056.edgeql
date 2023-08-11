CREATE MIGRATION m1m75qvj3xflssjviqnxnakxaqyr3tyvztm37mkg5v3pgydqgh4d2q
    ONTO m1akxdslbhsjmug2sjxgxaqt7dzzt7bheddu2b4yqufvkhxlytryha
{
  ALTER TYPE b2c::inventory::Stock {
      ALTER PROPERTY stock {
          RENAME TO quantity;
      };
  };
  ALTER TYPE b2c::inventory::StockLog {
      ALTER PROPERTY stock {
          RENAME TO quantity;
      };
  };
};
