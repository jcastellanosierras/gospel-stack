// GENERATED by @edgedb/generate v0.3.3

import * as $ from "../../reflection.ts";
import * as _ from "../../imports.ts";
import type * as _default from "../default.ts";
import type * as _common from "../common.ts";
import type * as _std from "../std.ts";
import type * as _api_usage from "./api_usage.ts";
export type $InvoiceλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _common.$HasCompanyOwnerPrivateλShape & {
  "name": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "invoice_lines": $.LinkDesc<$InvoiceLine, $.Cardinality.Many, {}, false, true,  false, false>;
  "api_usage_request": $.LinkDesc<_api_usage.$Request, $.Cardinality.Many, {}, false, true,  false, false>;
  "<invoice[is client::invoices::InvoiceLine]": $.LinkDesc<$InvoiceLine, $.Cardinality.Many, {}, false, false,  false, false>;
  "<invoice[is client::api_usage::Request]": $.LinkDesc<_api_usage.$Request, $.Cardinality.Many, {}, false, false,  false, false>;
  "<invoice": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $Invoice = $.ObjectType<"client::invoices::Invoice", $InvoiceλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._common.$HasCompanyOwnerPrivate['__exclusives__'],
]>;
const $Invoice = $.makeType<$Invoice>(_.spec, "89130b52-3699-11ee-bb1a-bde96291f7ad", _.syntax.literal);

const Invoice: $.$expr_PathNode<$.TypeSet<$Invoice, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Invoice, $.Cardinality.Many), null);

export type $InvoiceLineλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _common.$HasCompanyOwnerPrivateλShape & {
  "invoice": $.LinkDesc<$Invoice, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "name": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "<invoice_lines[is client::invoices::Invoice]": $.LinkDesc<$Invoice, $.Cardinality.Many, {}, false, false,  false, false>;
  "<invoice_lines": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $InvoiceLine = $.ObjectType<"client::invoices::InvoiceLine", $InvoiceLineλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._common.$HasCompanyOwnerPrivate['__exclusives__'],
]>;
const $InvoiceLine = $.makeType<$InvoiceLine>(_.spec, "89a1914c-3699-11ee-b4b2-fde82cabcb04", _.syntax.literal);

const InvoiceLine: $.$expr_PathNode<$.TypeSet<$InvoiceLine, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($InvoiceLine, $.Cardinality.Many), null);



export { $Invoice, Invoice, $InvoiceLine, InvoiceLine };

type __defaultExports = {
  "Invoice": typeof Invoice;
  "InvoiceLine": typeof InvoiceLine
};
const __defaultExports: __defaultExports = {
  "Invoice": Invoice,
  "InvoiceLine": InvoiceLine
};
export default __defaultExports;
