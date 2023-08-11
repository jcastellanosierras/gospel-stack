CREATE MIGRATION m1dogxkepbfq3jh7stgbxp3t255zmfif42ysnjrahnbdryy346ge7q
    ONTO m1sxox6hdzb27zsqiwxtcwe3ohhaqd7tlrvnksq733hq3mfbqathza
{
  ALTER TYPE default::Session {
      ALTER PROPERTY expiration_date {
          RENAME TO expires_at;
      };
  };
  ALTER TYPE default::Session {
      ALTER PROPERTY expires_at {
          SET REQUIRED USING (<std::datetime>{});
      };
  };
};
