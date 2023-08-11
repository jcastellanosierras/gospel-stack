CREATE MIGRATION m14jtwtgkxopp3qbfs2hx5eg34wvkhjpahyp3qey4vnma53q7p4g2q
    ONTO m15jyib4a62xqcmm6unmijrqzlskxtbps2ixm57t4goac5rh6ov57q
{
  ALTER TYPE b2c::inventory::SupplierStockLog {
      ALTER PROPERTY stock {
          SET TYPE std::str USING (<std::str>.stock);
      };
  };
};
