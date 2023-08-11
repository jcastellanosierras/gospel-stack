CREATE MIGRATION m1pxxvcl7z57vfno6ihh5guqfru2cdxwkmzknum2p4rohkp5wxdo3q
    ONTO m1cykqznpzrws6ixv4jzjupejf3cawouwmjvy2avt445ynzflundda
{
  CREATE MODULE client::api_usage IF NOT EXISTS;
  CREATE MODULE client::invoices IF NOT EXISTS;
  CREATE TYPE client::invoices::Invoice EXTENDING default::DatedType, common::HasCompanyOwnerPrivate {
      CREATE PROPERTY name: std::str;
  };
  CREATE SCALAR TYPE client::api_usage::RequestType EXTENDING enum<STOCK, PRODUCT>;
  CREATE TYPE client::api_usage::Request EXTENDING default::DatedType, common::HasCompanyOwnerPrivate {
      CREATE LINK invoice: client::invoices::Invoice;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY request_type: client::api_usage::RequestType;
  };
};
