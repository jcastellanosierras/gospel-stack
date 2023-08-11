CREATE MIGRATION m14sx6skb7y5bv6xk4dz35iskbefl4fr7oy7srermrvpbtf63wl27a
    ONTO m1qnyadmtktohyb4rwvycjvqwv3uh3b7tgff5qrce2cwepc4bpjf6a
{
  ALTER TYPE category::OwnerCategory {
      DROP ACCESS POLICY admin_has_full_access;
  };
};
