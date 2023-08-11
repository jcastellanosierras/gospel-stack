module b2c {
  module sales {
  # Futuro modulo de ventas y TPV para la app de B2C

    type SaleOrder extending default::DatedType, common::HasCompanyOwnerPrivate {
      name: str;

      multi sale_order_lines: SaleOrderLine;
    }

    type SaleOrderLine extending default::DatedType, common::HasCompanyOwnerPrivate{
      name: str;
      product: b2c::inventory::Product;
      qty: float64;
      price: float64;
      discount: float64;
      property subtotal := .price * .qty * .discount;

    }

  }
}
