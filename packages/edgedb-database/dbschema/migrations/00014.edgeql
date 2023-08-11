CREATE MIGRATION m1imwzekjdzgd4255vzhrmklxecxjg3nx6ubssj4agf7wx5gohyz2a
    ONTO m1fboag5ehx44uufskiettlthlhppwxcafskwzjol5avps7itlwlwa
{
  ALTER TYPE default::Product {
      CREATE ACCESS POLICY rest_users_can_select
          ALLOW SELECT USING (SELECT
              true
          );
  };
};
