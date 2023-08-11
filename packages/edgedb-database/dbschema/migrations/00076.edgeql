CREATE MIGRATION m1hfy3uj5i7lnxpbbgosh66yrzrfwdn2wcqfbu65efa53nyyvhf3hq
    ONTO m1hmisjdjlotgxeozj6hujoj7qacc27cw764u2jb6goko5tz2upd6a
{
  ALTER TYPE client::api_usage::Request {
      CREATE ACCESS POLICY owner_all
          ALLOW ALL USING (((GLOBAL default::current_user).company.id ?= .owner.id));
  };
};
