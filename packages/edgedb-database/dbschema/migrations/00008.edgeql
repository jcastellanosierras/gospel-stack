CREATE MIGRATION m1es6azrniau5fqht3pv4r5vjzlwze3ttrqgafbjwzs5evrcxninuq
    ONTO m1sze3xtqnmdqikwnwiefjjnlud7efo4znbou7riojdialg72f54za
{
  ALTER TYPE default::Product {
      CREATE LINK brand: default::Brand;
  };
};
