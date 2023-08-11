CREATE MIGRATION m1pkvi2xy6ezu6drn22yxdm65og27te5rf2mm4npssejg5hzt37efa
    ONTO m1aadzwlroln4aoyvheindnbskggw3gyoprcwumyz2iu3py2gncjda
{
  ALTER TYPE client::invoices::Invoice {
      CREATE MULTI LINK invoice_lines := (.<invoice[IS client::invoices::InvoiceLine]);
  };
};
