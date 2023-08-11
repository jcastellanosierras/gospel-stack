CREATE MIGRATION m16c6q7py2wxatgptfu7alba25ozliiu4qndpnwgcar5q63zsnciuq
    ONTO m1kmbfgloov5fh6r6egevudzcyyzhvbm5ftqushiqiibyaegt5j66a
{
  ALTER TYPE default::Product {
      CREATE LINK global_category: category::GlobalCategory;
      CREATE LINK owner_category: category::OwnerCategory;
  };
};
