CREATE MIGRATION m1e63i2znb7oxguklpt3zovtiyxcgxmzqlm6l53w2dzhmneqkv3fja
    ONTO m1p7mvyxoyxzoolmgmokxxolbxiz4qbibwovinpv5xoileze7owmlq
{
  ALTER TYPE default::Company {
      CREATE LINK brands := (.<owner[IS default::Brand]);
  };
};
