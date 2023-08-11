CREATE MIGRATION m1a4dsjggqfohiipp66epxk63nmrubtmbir7kc5gqhretfivl26kmq
    ONTO m1pkvi2xy6ezu6drn22yxdm65og27te5rf2mm4npssejg5hzt37efa
{
  ALTER TYPE client::invoices::Invoice {
      CREATE MULTI LINK api_usage_request := (.<invoice[IS client::api_usage::Request]);
  };
};
