CREATE MIGRATION m1wamyou2z3bb2zik3mjzyduxkttz7nfikmm6xojyegctd6ptuynoa
    ONTO m1nerqc6qg7ztgov2zxglx3dn4shhsbysd3jfvhehwbp6xtrsktqhq
{
  ALTER TYPE client::inventory::Product {
      ALTER ACCESS POLICY public_select ALLOW SELECT;
  };
};
