// GENERATED by @edgedb/generate v0.3.3

import * as $ from "../reflection.ts";
import * as _ from "../imports.ts";
import type * as _schema from "./schema.ts";
import type * as _std from "./std.ts";
export type $TransactionIsolation = {
  "RepeatableRead": $.$expr_Literal<$TransactionIsolation>;
  "Serializable": $.$expr_Literal<$TransactionIsolation>;
} & $.EnumType<"sys::TransactionIsolation", ["RepeatableRead", "Serializable"]>;
const TransactionIsolation: $TransactionIsolation = $.makeType<$TransactionIsolation>(_.spec, "0b67ef9e-27fb-11ee-b0c3-1d41dab3c7c6", _.syntax.literal);

export type $VersionStage = {
  "dev": $.$expr_Literal<$VersionStage>;
  "alpha": $.$expr_Literal<$VersionStage>;
  "beta": $.$expr_Literal<$VersionStage>;
  "rc": $.$expr_Literal<$VersionStage>;
  "final": $.$expr_Literal<$VersionStage>;
} & $.EnumType<"sys::VersionStage", ["dev", "alpha", "beta", "rc", "final"]>;
const VersionStage: $VersionStage = $.makeType<$VersionStage>(_.spec, "0b684084-27fb-11ee-8390-9d538e2c85e7", _.syntax.literal);

export type $SystemObjectλShape = $.typeutil.flatten<_schema.$Object_081125e027fb11eeb4969dec7819f221λShape & {
}>;
type $SystemObject = $.ObjectType<"sys::SystemObject", $SystemObjectλShape, null, [
  ..._schema.$Object_081125e027fb11eeb4969dec7819f221['__exclusives__'],
]>;
const $SystemObject = $.makeType<$SystemObject>(_.spec, "0b689066-27fb-11ee-abea-4d739d51567c", _.syntax.literal);

const SystemObject: $.$expr_PathNode<$.TypeSet<$SystemObject, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($SystemObject, $.Cardinality.Many), null);

export type $ExternalObjectλShape = $.typeutil.flatten<$SystemObjectλShape & {
}>;
type $ExternalObject = $.ObjectType<"sys::ExternalObject", $ExternalObjectλShape, null, [
  ...$SystemObject['__exclusives__'],
]>;
const $ExternalObject = $.makeType<$ExternalObject>(_.spec, "0b6f6a9e-27fb-11ee-8e44-472a733dcae2", _.syntax.literal);

const ExternalObject: $.$expr_PathNode<$.TypeSet<$ExternalObject, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($ExternalObject, $.Cardinality.Many), null);

export type $DatabaseλShape = $.typeutil.flatten<$ExternalObjectλShape & _schema.$AnnotationSubjectλShape & {
  "name": $.PropertyDesc<_std.$str, $.Cardinality.One, true, false, false, false>;
}>;
type $Database = $.ObjectType<"sys::Database", $DatabaseλShape, null, [
  ...$ExternalObject['__exclusives__'],
  ..._schema.$AnnotationSubject['__exclusives__'],
  {name: {__element__: _std.$str, __cardinality__: $.Cardinality.One | $.Cardinality.AtMostOne },},
]>;
const $Database = $.makeType<$Database>(_.spec, "0b763ac2-27fb-11ee-8a4e-5fb2e5ee5ec6", _.syntax.literal);

const Database: $.$expr_PathNode<$.TypeSet<$Database, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Database, $.Cardinality.Many), null);

export type $ExtensionPackageλShape = $.typeutil.flatten<$SystemObjectλShape & _schema.$AnnotationSubjectλShape & {
  "script": $.PropertyDesc<_std.$str, $.Cardinality.One, false, false, false, false>;
  "version": $.PropertyDesc<$.NamedTupleType<{major: _std.$int64, minor: _std.$int64, stage: $VersionStage, stage_no: _std.$int64, local: $.ArrayType<_std.$str>}>, $.Cardinality.One, false, false, false, false>;
  "<package[is schema::Extension]": $.LinkDesc<_schema.$Extension, $.Cardinality.AtMostOne, {}, true, false,  false, false>;
  "<package": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $ExtensionPackage = $.ObjectType<"sys::ExtensionPackage", $ExtensionPackageλShape, null, [
  ...$SystemObject['__exclusives__'],
  ..._schema.$AnnotationSubject['__exclusives__'],
]>;
const $ExtensionPackage = $.makeType<$ExtensionPackage>(_.spec, "0b830afe-27fb-11ee-a493-bf4ab15055ce", _.syntax.literal);

const ExtensionPackage: $.$expr_PathNode<$.TypeSet<$ExtensionPackage, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($ExtensionPackage, $.Cardinality.Many), null);

export type $RoleλShape = $.typeutil.flatten<$SystemObjectλShape & _schema.$InheritingObjectλShape & _schema.$AnnotationSubjectλShape & {
  "name": $.PropertyDesc<_std.$str, $.Cardinality.One, true, false, false, false>;
  "superuser": $.PropertyDesc<_std.$bool, $.Cardinality.One, false, false, false, false>;
  "is_superuser": $.PropertyDesc<_std.$bool, $.Cardinality.One, false, true, false, false>;
  "password": $.PropertyDesc<_std.$str, $.Cardinality.AtMostOne, false, false, false, false>;
  "member_of": $.LinkDesc<$Role, $.Cardinality.Many, {}, false, false,  false, false>;
  "<member_of[is sys::Role]": $.LinkDesc<$Role, $.Cardinality.Many, {}, false, false,  false, false>;
  "<member_of": $.LinkDesc<$.ObjectType, $.Cardinality.Many, {}, false, false,  false, false>;
}>;
type $Role = $.ObjectType<"sys::Role", $RoleλShape, null, [
  ...$SystemObject['__exclusives__'],
  ..._schema.$InheritingObject['__exclusives__'],
  ..._schema.$AnnotationSubject['__exclusives__'],
  {name: {__element__: _std.$str, __cardinality__: $.Cardinality.One | $.Cardinality.AtMostOne },},
]>;
const $Role = $.makeType<$Role>(_.spec, "0b929d02-27fb-11ee-8f1a-bf9baf581baa", _.syntax.literal);

const Role: $.$expr_PathNode<$.TypeSet<$Role, $.Cardinality.Many>, null> = _.syntax.$PathNode($.$toSet($Role, $.Cardinality.Many), null);

type get_versionλFuncExpr = $.$expr_Function<
  $.NamedTupleType<{major: _std.$int64, minor: _std.$int64, stage: $VersionStage, stage_no: _std.$int64, local: $.ArrayType<_std.$str>}>, $.Cardinality.One
>;
/**
 * Return the server version as a tuple.
 */
function get_version(): get_versionλFuncExpr;
function get_version(...args: any[]) {
  const {returnType, cardinality, args: positionalArgs, namedArgs} = _.syntax.$resolveOverload('sys::get_version', args, _.spec, [
    {args: [], returnTypeId: "0b854a1c-27fb-11ee-abf7-5753182be947"},
  ]);
  return _.syntax.$expressionify({
    __kind__: $.ExpressionKind.Function,
    __element__: returnType,
    __cardinality__: cardinality,
    __name__: "sys::get_version",
    __args__: positionalArgs,
    __namedargs__: namedArgs,
  }) as any;
};

type get_version_as_strλFuncExpr = $.$expr_Function<
  _std.$str, $.Cardinality.One
>;
/**
 * Return the server version as a string.
 */
function get_version_as_str(): get_version_as_strλFuncExpr;
function get_version_as_str(...args: any[]) {
  const {returnType, cardinality, args: positionalArgs, namedArgs} = _.syntax.$resolveOverload('sys::get_version_as_str', args, _.spec, [
    {args: [], returnTypeId: "00000000-0000-0000-0000-000000000101"},
  ]);
  return _.syntax.$expressionify({
    __kind__: $.ExpressionKind.Function,
    __element__: returnType,
    __cardinality__: cardinality,
    __name__: "sys::get_version_as_str",
    __args__: positionalArgs,
    __namedargs__: namedArgs,
  }) as any;
};

type get_instance_nameλFuncExpr = $.$expr_Function<
  _std.$str, $.Cardinality.One
>;
/**
 * Return the server instance name.
 */
function get_instance_name(): get_instance_nameλFuncExpr;
function get_instance_name(...args: any[]) {
  const {returnType, cardinality, args: positionalArgs, namedArgs} = _.syntax.$resolveOverload('sys::get_instance_name', args, _.spec, [
    {args: [], returnTypeId: "00000000-0000-0000-0000-000000000101"},
  ]);
  return _.syntax.$expressionify({
    __kind__: $.ExpressionKind.Function,
    __element__: returnType,
    __cardinality__: cardinality,
    __name__: "sys::get_instance_name",
    __args__: positionalArgs,
    __namedargs__: namedArgs,
  }) as any;
};

type get_transaction_isolationλFuncExpr = $.$expr_Function<
  $TransactionIsolation, $.Cardinality.One
>;
/**
 * Return the isolation level of the current transaction.
 */
function get_transaction_isolation(): get_transaction_isolationλFuncExpr;
function get_transaction_isolation(...args: any[]) {
  const {returnType, cardinality, args: positionalArgs, namedArgs} = _.syntax.$resolveOverload('sys::get_transaction_isolation', args, _.spec, [
    {args: [], returnTypeId: "0b67ef9e-27fb-11ee-b0c3-1d41dab3c7c6"},
  ]);
  return _.syntax.$expressionify({
    __kind__: $.ExpressionKind.Function,
    __element__: returnType,
    __cardinality__: cardinality,
    __name__: "sys::get_transaction_isolation",
    __args__: positionalArgs,
    __namedargs__: namedArgs,
  }) as any;
};

type get_current_databaseλFuncExpr = $.$expr_Function<
  _std.$str, $.Cardinality.One
>;
/**
 * Return the name of the current database as a string.
 */
function get_current_database(): get_current_databaseλFuncExpr;
function get_current_database(...args: any[]) {
  const {returnType, cardinality, args: positionalArgs, namedArgs} = _.syntax.$resolveOverload('sys::get_current_database', args, _.spec, [
    {args: [], returnTypeId: "00000000-0000-0000-0000-000000000101"},
  ]);
  return _.syntax.$expressionify({
    __kind__: $.ExpressionKind.Function,
    __element__: returnType,
    __cardinality__: cardinality,
    __name__: "sys::get_current_database",
    __args__: positionalArgs,
    __namedargs__: namedArgs,
  }) as any;
};



export { TransactionIsolation, VersionStage, $SystemObject, SystemObject, $ExternalObject, ExternalObject, $Database, Database, $ExtensionPackage, ExtensionPackage, $Role, Role };

type __defaultExports = {
  "TransactionIsolation": typeof TransactionIsolation;
  "VersionStage": typeof VersionStage;
  "SystemObject": typeof SystemObject;
  "ExternalObject": typeof ExternalObject;
  "Database": typeof Database;
  "ExtensionPackage": typeof ExtensionPackage;
  "Role": typeof Role;
  "get_version": typeof get_version;
  "get_version_as_str": typeof get_version_as_str;
  "get_instance_name": typeof get_instance_name;
  "get_transaction_isolation": typeof get_transaction_isolation;
  "get_current_database": typeof get_current_database
};
const __defaultExports: __defaultExports = {
  "TransactionIsolation": TransactionIsolation,
  "VersionStage": VersionStage,
  "SystemObject": SystemObject,
  "ExternalObject": ExternalObject,
  "Database": Database,
  "ExtensionPackage": ExtensionPackage,
  "Role": Role,
  "get_version": get_version,
  "get_version_as_str": get_version_as_str,
  "get_instance_name": get_instance_name,
  "get_transaction_isolation": get_transaction_isolation,
  "get_current_database": get_current_database
};
export default __defaultExports;
