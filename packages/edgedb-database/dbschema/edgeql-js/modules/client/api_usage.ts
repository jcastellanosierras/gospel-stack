// GENERATED by @edgedb/generate v0.3.3

import * as $ from "../../reflection.ts";
import * as _ from "../../imports.ts";
import type * as _default from "../default.ts";
import type * as _common from "../common.ts";
import type * as _invoices from "./invoices.ts";
export type $RequestType = {
  "STOCK": $.$expr_Literal<$RequestType>;
  "PRODUCT": $.$expr_Literal<$RequestType>;
} & $.EnumType<"client::api_usage::RequestType", ["STOCK", "PRODUCT"]>;
const RequestType: $RequestType = $.makeType<$RequestType>(_.spec, "891fd0c6-3699-11ee-b5ed-b70007dd6a12", _.syntax.literal);

export type $RequestλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _common.$HasCompanyOwnerPrivateλShape & {
  "invoice": $.LinkDesc<_invoices.$Invoice, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "request_type": $.PropertyDesc<$RequestType, $.Cardinality.One, false, false, false, false>;
  "<api_usage_request[is client::invoices::Invoice]": $.LinkDesc<_invoices.$Invoice, $.Cardinality.Many, {}, false, false,  false, false>;
  "<api_usage_request": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $Request = $.ObjectType<"client::api_usage::Request", $RequestλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._common.$HasCompanyOwnerPrivate['__exclusives__'],
]>;
const $Request = $.makeType<$Request>(_.spec, "891fe6ba-3699-11ee-98e8-61766c838e82", _.syntax.literal);

const Request: $.$expr_PathNode<$.TypeSet<$Request, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Request, $.Cardinality.Many), null);



export { RequestType, $Request, Request };

type __defaultExports = {
  "RequestType": typeof RequestType;
  "Request": typeof Request
};
const __defaultExports: __defaultExports = {
  "RequestType": RequestType,
  "Request": Request
};
export default __defaultExports;