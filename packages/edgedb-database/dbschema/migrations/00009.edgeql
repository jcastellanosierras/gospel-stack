CREATE MIGRATION m1p7mvyxoyxzoolmgmokxxolbxiz4qbibwovinpv5xoileze7owmlq
    ONTO m1es6azrniau5fqht3pv4r5vjzlwze3ttrqgafbjwzs5evrcxninuq
{
  ALTER TYPE default::Brand {
      CREATE PROPERTY description: std::str;
  };
};
