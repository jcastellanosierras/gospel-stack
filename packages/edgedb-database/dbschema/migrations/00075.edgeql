CREATE MIGRATION m1hmisjdjlotgxeozj6hujoj7qacc27cw764u2jb6goko5tz2upd6a
    ONTO m1a4dsjggqfohiipp66epxk63nmrubtmbir7kc5gqhretfivl26kmq
{
  ALTER TYPE client::api_usage::Request {
      DROP PROPERTY name;
      ALTER PROPERTY request_type {
          SET REQUIRED USING (<client::api_usage::RequestType>{});
      };
  };
};
