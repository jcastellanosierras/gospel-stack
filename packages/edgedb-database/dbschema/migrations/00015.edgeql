CREATE MIGRATION m1voxdvahjft24qjmhrrasnmlzqvoiuvkrmk7iciyto74k5zujcyta
    ONTO m1imwzekjdzgd4255vzhrmklxecxjg3nx6ubssj4agf7wx5gohyz2a
{
  ALTER TYPE default::Product {
      ALTER ACCESS POLICY rest_users_can_select USING (SELECT
          (true IF EXISTS (GLOBAL default::current_user_id) ELSE false)
      );
  };
};
