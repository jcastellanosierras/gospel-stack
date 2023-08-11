CREATE MIGRATION m1iyn74itjrjdpolfhb32ofvymbfb22l5z3z6dg2zvkrucwoeau6gq
    ONTO m13nypkav2nqzvzzswfyknvseuecfhcua7vhkyiruiafefc2pcp5pa
{
  ALTER TYPE api::product::Product {
      DROP ACCESS POLICY deny_all_except_owner_and_admin;
  };
};
