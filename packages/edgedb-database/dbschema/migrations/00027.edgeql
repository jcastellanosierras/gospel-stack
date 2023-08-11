CREATE MIGRATION m1q4x7zz5h2armfd64gm7mh7kal2rpaxc7mdlgz7ziibfc6xvbmmiq
    ONTO m14sx6skb7y5bv6xk4dz35iskbefl4fr7oy7srermrvpbtf63wl27a
{
  ALTER TYPE category::GlobalCategory {
      DROP ACCESS POLICY superadmin_has_full_access;
  };
};
