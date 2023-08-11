CREATE MIGRATION m1nerqc6qg7ztgov2zxglx3dn4shhsbysd3jfvhehwbp6xtrsktqhq
    ONTO m15wiaew2bhd5sl7dck2jwbk4reriuof7zopl76zpl5e63pqbsgxoa
{
  ALTER TYPE client::inventory::Product {
      CREATE ACCESS POLICY public_select
          ALLOW ALL ;
      ALTER PROPERTY reference {
          RESET OPTIONALITY;
      };
  };
};
