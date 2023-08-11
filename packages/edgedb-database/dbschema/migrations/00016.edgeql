CREATE MIGRATION m1vdxs6vhaqpxuhteay6cshcymgo2zxf25f75faxkjgkl6t7uj73ea
    ONTO m1voxdvahjft24qjmhrrasnmlzqvoiuvkrmk7iciyto74k5zujcyta
{
  ALTER TYPE default::Product {
      ALTER ACCESS POLICY rest_users_can_select USING (SELECT
          (true IF EXISTS ((SELECT
              default::User
          FILTER
              (.id = GLOBAL default::current_user_id)
          )) ELSE false)
      );
  };
};
