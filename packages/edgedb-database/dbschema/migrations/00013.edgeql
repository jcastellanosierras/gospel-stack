CREATE MIGRATION m1fboag5ehx44uufskiettlthlhppwxcafskwzjol5avps7itlwlwa
    ONTO m1cxudpcdz4ycx3g7p4opjxhqugqusli52clrxrmhanhecybl7h4za
{
  ALTER TYPE default::Session {
      DROP ACCESS POLICY user_can_create;
  };
  ALTER TYPE default::Session {
      CREATE ACCESS POLICY user_can_select_and_create
          ALLOW SELECT, INSERT USING (((GLOBAL default::current_user).id ?= .user.id));
  };
};
