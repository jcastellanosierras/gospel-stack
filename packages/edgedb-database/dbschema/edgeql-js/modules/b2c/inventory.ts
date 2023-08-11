// GENERATED by @edgedb/generate v0.3.3

import * as $ from "../../reflection.ts";
import * as _ from "../../imports.ts";
import type * as _default from "../default.ts";
import type * as _common from "../common.ts";
import type * as _category from "../category.ts";
import type * as _std from "../std.ts";
import type * as _sales from "./sales.ts";
export type $ProductState = {
  "ACTIVE": $.$expr_Literal<$ProductState>;
  "INACTIVE": $.$expr_Literal<$ProductState>;
  "PENDING_REVIEW": $.$expr_Literal<$ProductState>;
} & $.EnumType<"b2c::inventory::ProductState", ["ACTIVE", "INACTIVE", "PENDING_REVIEW"]>;
const ProductState: $ProductState = $.makeType<$ProductState>(_.spec, "c28cea5a-36fe-11ee-af9d-27d536b2c247", _.syntax.literal);

export type $ProductλShape = $.typeutil.flatten<_default.$DatedTypeλShape & _default.$HasImagesλShape & _common.$HasCompanyOwnerPrivateλShape & {
  "brand": $.LinkDesc<_default.$Brand, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "global_category": $.LinkDesc<_category.$GlobalCategory, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "owner_category": $.LinkDesc<_category.$OwnerCategory, $.Cardinality.AtMostOne, {}, false, false,  false, false>;
  "barcode": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "color": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "ean": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "family": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "family_code": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "name": $.PropertyDesc<_std.$str, $.Cardinality.One, false, false, false, false>;
  "notes": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "reference": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "sale_price": $.PropertyDesc<_std.$float64, $.Cardinality.AtMostOne, false, false, false, false>;
  "season": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "size": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "state": $.PropertyDesc<$ProductState, $.Cardinality.AtMostOne, false, false, false, false>;
  "stock_sync": $.PropertyDesc<_std.$bool, $.Cardinality.AtMostOne, false, false, false, false>;
  "year": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "stock": $.LinkDesc<$Stock, $.Cardinality.Many, {}, false, true,  false, false>;
  "stock_qty": $.PropertyDesc<_std.$float64, $.Cardinality.Many, false, true, false, false>;
  "<product[is b2c::inventory::Stock]": $.LinkDesc<$Stock, $.Cardinality.Many, {}, false, false,  false, false>;
  "<product[is b2c::inventory::StockLog]": $.LinkDesc<$StockLog, $.Cardinality.Many, {}, false, false,  false, false>;
  "<product[is b2c::sales::SaleOrderLine]": $.LinkDesc<_sales.$SaleOrderLine, $.Cardinality.Many, {}, false, false,  false, false>;
  "<product": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $Product = $.ObjectType<"b2c::inventory::Product", $ProductλShape, null, [
  ..._default.$DatedType['__exclusives__'],
  ..._default.$HasImages['__exclusives__'],
  ..._common.$HasCompanyOwnerPrivate['__exclusives__'],
]>;
const $Product = $.makeType<$Product>(_.spec, "c28cf888-36fe-11ee-a563-15bea4a708eb", _.syntax.literal);

const Product: $.$expr_PathNode<$.TypeSet<$Product, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Product, $.Cardinality.Many), null);

export type $StockλShape = $.typeutil.flatten<_std.$Object_07d9fd2227fb11ee8ad3435ff4e00f5fλShape & {
  "product": $.LinkDesc<$Product, $.Cardinality.One, {}, false, false,  false, false>;
  "quantity": $.PropertyDesc<_std.$float64, $.Cardinality.One, false, false, false, false>;
  "<stock[is b2c::inventory::Product]": $.LinkDesc<$Product, $.Cardinality.Many, {}, false, false,  false, false>;
  "<stock": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $Stock = $.ObjectType<"b2c::inventory::Stock", $StockλShape, null, [
  ..._std.$Object_07d9fd2227fb11ee8ad3435ff4e00f5f['__exclusives__'],
]>;
const $Stock = $.makeType<$Stock>(_.spec, "c2d9190c-36fe-11ee-a6cb-9182090e5c8f", _.syntax.literal);

const Stock: $.$expr_PathNode<$.TypeSet<$Stock, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Stock, $.Cardinality.Many), null);

export type $StockLogλShape = $.typeutil.flatten<_std.$Object_07d9fd2227fb11ee8ad3435ff4e00f5fλShape & {
  "product": $.LinkDesc<$Product, $.Cardinality.One, {}, false, false,  false, false>;
  "action": $.PropertyDesc<_std.$str, $.Cardinality.One, false, false, false, false>;
  "quantity": $.PropertyDesc<_std.$str, $.Cardinality.One, false, false, false, false>;
  "change": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "timestamp": $.PropertyDesc<_std.$datetime, $.Cardinality.AtMostOne, false, false, false, false>;
}>;
type $StockLog = $.ObjectType<"b2c::inventory::StockLog", $StockLogλShape, null, [
  ..._std.$Object_07d9fd2227fb11ee8ad3435ff4e00f5f['__exclusives__'],
]>;
const $StockLog = $.makeType<$StockLog>(_.spec, "c2db6acc-36fe-11ee-959a-bb51690a4527", _.syntax.literal);

const StockLog: $.$expr_PathNode<$.TypeSet<$StockLog, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($StockLog, $.Cardinality.Many), null);



export { ProductState, $Product, Product, $Stock, Stock, $StockLog, StockLog };

type __defaultExports = {
  "ProductState": typeof ProductState;
  "Product": typeof Product;
  "Stock": typeof Stock;
  "StockLog": typeof StockLog
};
const __defaultExports: __defaultExports = {
  "ProductState": ProductState,
  "Product": Product,
  "Stock": Stock,
  "StockLog": StockLog
};
export default __defaultExports;
