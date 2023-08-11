CREATE MIGRATION m1z7xnkjogv4kf34ipx7rek4zmrs7sao4g4jdx46j6vjwtpwhohveq
    ONTO m1lnjdm7zn4bt77gi7lypefqq7cniomp66jnh2h237vipdzwj6y77q
{
  CREATE TYPE default::ApiKey EXTENDING default::DatedType {
      CREATE REQUIRED PROPERTY key: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::Company {
      CREATE MULTI LINK api_keys: default::ApiKey;
  };
};
