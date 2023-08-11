module client {
  module invoices {
    type Invoice extending default::DatedType, common::HasCompanyOwnerPrivate {
      name: str;

      multi link invoice_lines := .<invoice[is InvoiceLine];
      multi link api_usage_request := .<invoice[is client::api_usage::Request];
    }
    
    type InvoiceLine extending default::DatedType, common::HasCompanyOwnerPrivate {
      name: str;
      invoice: Invoice;
    }
    
  }
}
