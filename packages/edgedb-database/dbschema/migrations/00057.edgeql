CREATE MIGRATION m13exmogf73otk2z6vevrps54yvwpqbxrrd6f77n57rpgeryonku7q
    ONTO m1m75qvj3xflssjviqnxnakxaqyr3tyvztm37mkg5v3pgydqgh4d2q
{
  ALTER TYPE b2c::inventory::Product {
      CREATE PROPERTY stock := (.<product[IS b2c::inventory::Stock].quantity);
  };
};
