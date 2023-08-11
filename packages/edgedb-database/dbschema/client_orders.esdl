module client {
  module orders {

    type PurchaseOrder extending default::DatedType, common::HasUserOwnerPrivate {
      name: str;

      #multi link order_lines := .<purchase_order[client::orders::PurchaseOrderLine]; ## POR QUE NO ME DEJA?
    }

    type PurchaseOrderLine extending default::DatedType, common::HasUserOwnerPrivate{
      name: str;
      product: str;#client::inventory::Product;
      qty: float64;
      price: float64;
      discount: float64 {
        constraint min_value(0.0);
        constraint max_value(1.0);
      };
      property subtotal := .price * .qty * (1 - .discount);
      link purchase_order: client::orders::PurchaseOrder;

    }
    
  }
}
