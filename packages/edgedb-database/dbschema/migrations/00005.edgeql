CREATE MIGRATION m1lnjdm7zn4bt77gi7lypefqq7cniomp66jnh2h237vipdzwj6y77q
    ONTO m1dogxkepbfq3jh7stgbxp3t255zmfif42ysnjrahnbdryy346ge7q
{
  ALTER TYPE default::DatedType {
      ALTER PROPERTY created_at {
          SET REQUIRED USING (<std::datetime>{});
      };
  };
};
