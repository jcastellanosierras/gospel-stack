CREATE MIGRATION m1kmbfgloov5fh6r6egevudzcyyzhvbm5ftqushiqiibyaegt5j66a
    ONTO m1wspeww5pwq6ugv54p6exgsgvcazjqf7rk6amogsxfpnd6yyv2xeq
{
  ALTER TYPE category::OwnerCategory {
      ALTER LINK owner {
          SET TYPE default::Company USING (.owner[IS default::Company]);
      };
  };
};
