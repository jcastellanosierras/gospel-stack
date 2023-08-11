CREATE MIGRATION m1akxdslbhsjmug2sjxgxaqt7dzzt7bheddu2b4yqufvkhxlytryha
    ONTO m1ynq4nt2x4cnwa7tf53tog54dullezudhmytsfbhvg7ski5k2zrna
{
  ALTER TYPE b2c::inventory::SupplierStockLog RENAME TO b2c::inventory::StockLog;
};
