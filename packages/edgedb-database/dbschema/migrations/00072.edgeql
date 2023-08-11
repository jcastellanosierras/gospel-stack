CREATE MIGRATION m1aadzwlroln4aoyvheindnbskggw3gyoprcwumyz2iu3py2gncjda
    ONTO m1pxxvcl7z57vfno6ihh5guqfru2cdxwkmzknum2p4rohkp5wxdo3q
{
  CREATE TYPE client::invoices::InvoiceLine EXTENDING default::DatedType, common::HasCompanyOwnerPrivate {
      CREATE LINK invoice: client::invoices::Invoice;
      CREATE PROPERTY name: std::str;
  };
};
