// GENERATED by @edgedb/generate v0.3.3

import * as $ from "../../reflection.ts";
import * as _ from "../../imports.ts";
import type * as _default from "../default.ts";
import type * as _common from "../common.ts";
import type * as _std from "../std.ts";
export type $PurchaseOrderλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _common.$HasUserOwnerPrivateλShape & {
  "name": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "<purchase_order[is client::orders::PurchaseOrderLine]": $.LinkDesc<$PurchaseOrderLine, $.Cardinality.Many, {}, false, false,  false, false>;
  "<purchase_order": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $PurchaseOrder = $.ObjectType<"client::orders::PurchaseOrder", $PurchaseOrderλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._common.$HasUserOwnerPrivate['__exclusives__'],
]>;
const $PurchaseOrder = $.makeType<$PurchaseOrder>(_.spec, "82b6c140-3699-11ee-93b4-a10a8f30a6c3", _.syntax.literal);

const PurchaseOrder: $.$expr_PathNode<$.TypeSet<$PurchaseOrder, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($PurchaseOrder, $.Cardinality.Many), null);

export type $PurchaseOrderLineλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _common.$HasUserOwnerPrivateλShape & {
  "price": $.PropertyDesc<_std.$float64, $.Cardinality.AtMostOne, false, false, false, false>;
  "qty": $.PropertyDesc<_std.$float64, $.Cardinality.AtMostOne, false, false, false, false>;
  "name": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "purchase_order": $.LinkDesc<$PurchaseOrder, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "discount": $.PropertyDesc<_std.$float64, $.Cardinality.AtMostOne, false, false, false, false>;
  "subtotal": $.PropertyDesc<_std.$float64, $.Cardinality.AtMostOne, false, true, false, false>;
  "product": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
}>;
type $PurchaseOrderLine = $.ObjectType<"client::orders::PurchaseOrderLine", $PurchaseOrderLineλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._common.$HasUserOwnerPrivate['__exclusives__'],
]>;
const $PurchaseOrderLine = $.makeType<$PurchaseOrderLine>(_.spec, "82bdf28a-3699-11ee-9dae-b15ab648a7f6", _.syntax.literal);

const PurchaseOrderLine: $.$expr_PathNode<$.TypeSet<$PurchaseOrderLine, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($PurchaseOrderLine, $.Cardinality.Many), null);



export { $PurchaseOrder, PurchaseOrder, $PurchaseOrderLine, PurchaseOrderLine };

type __defaultExports = {
  "PurchaseOrder": typeof PurchaseOrder;
  "PurchaseOrderLine": typeof PurchaseOrderLine
};
const __defaultExports: __defaultExports = {
  "PurchaseOrder": PurchaseOrder,
  "PurchaseOrderLine": PurchaseOrderLine
};
export default __defaultExports;
