module client {
  module api_usage {
    scalar type RequestType extending enum<STOCK, PRODUCT>;

    type Request extending default::DatedType, common::HasCompanyOwnerPrivate {
      required request_type: RequestType;
      invoice: client::invoices::Invoice; 

      access policy owner_all
      allow all
      using (
        global default::current_user.company.id ?= .owner.id
      );
    }
  }
}
