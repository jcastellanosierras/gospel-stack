CREATE MIGRATION m15wiaew2bhd5sl7dck2jwbk4reriuof7zopl76zpl5e63pqbsgxoa
    ONTO m13exmogf73otk2z6vevrps54yvwpqbxrrd6f77n57rpgeryonku7q
{
  ALTER TYPE b2c::inventory::Product {
      DROP PROPERTY stock;
  };
  ALTER TYPE b2c::inventory::Product {
      CREATE LINK stock := (.<product[IS b2c::inventory::Stock]);
      CREATE PROPERTY stock_qty := (.stock.quantity);
  };
};
