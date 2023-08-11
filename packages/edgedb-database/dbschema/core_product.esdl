module api {
  module product {
    # Futuro modulo de ventas y TPV para la app de B2C
    scalar type BrandState extending enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
    scalar type ProductState extending enum<ACTIVE, INACTIVE, PENDING_REVIEW>;

   type Product extending default::DatedType, default::HasImages {
      required name: str;
      required ean: str {
        constraint exclusive
      };
      reference: str;
      family: str;
      family_code: str;
      year: str;
      season: str;
      color: str;
      size: str;
      sale_price: float64;
      notes: str;

      brand: Brand;
      owner_category: OwnerCategory;
      global_category: GlobalCategory;

      is_discontinued: bool;
      is_future_model: bool;

      owner: api::account::Account;

      #link stock := (select SupplierStock filter .ean = detached Product.ean); # Devuelve todos los records de Stock, no he averiguado por que ocurre
      #multi link suppliers := .<product[is SupplierStock];
      #link active_suppliers := (
      #  select .suppliers filter .quantity > 0
      #);
      

      annotation description := "Esta BD de produtos unifica informacion a traves de EAN como codigo unico, que es el codigo identificador
      universal. El EAN es lo que debe usarse para poder sincronizar aplicaciones y en definitiva para identificar el articulo de forma unica
      en cualquier aplicacion conectada a esta API.";

      access policy public_select
      allow select;

      access policy product_insert
      allow insert
      using (api::account::UserPermissons.UP_INSERT IN global default::api_current_user.client_product_permissons);

      access policy product_insert_if_owner
      allow insert
      using (global default::current_account_id ?= .owner.id);
      # access policy product_insert_by_apikey
      # allow insert
      # using (
      #   api::account::ApiPermissons.API_INSERT IN global default::api_current_apikey.permissons
      # );

      # # Porque no me deja hacer esto?
      # using (any({
      #   api::account::UserPermissons.UP_INSERT IN global default::api_current_user.client_product_permissons,
      #   api::account::ApiPermissons.API_INSERT IN global default::api_current_apikey.permissons,
      #   }));

      access policy product_update
      allow update
      using (select api::account::UserPermissons.UP_UPDATE IN global default::api_current_user.client_product_permissons);

      access policy product_delete
      allow delete
      using (select api::account::UserPermissons.UP_DELETE IN global default::api_current_user.client_product_permissons);


      # access policy deny_all_except_owner_and_admin
      # deny update, insert, delete
      # using (all({
      #   global default::api_current_user.account.id ?!= .owner.id,
      #   global default::current_account_id ?!= .owner.id,
      #   global default::api_current_user.user_role ?!= api::account::AvailableRole.ADMIN
      #   })
      # );
    }





    type Brand extending default::DatedType, default::HasImages, default::HasAvatar {
      required state: BrandState {
          default := "PENDING_REVIEW"
        }

      required name: str {
        constraint exclusive;
      };
      required reference: str;
      description: str;

      owner: api::account::Account;
    }

    abstract type Category extending default::DatedType, default::HasAvatar, default::HasImages, common::AdminRoleHasFullAccessAccessPolicy {
      required name: str;
      parent: Category;
      multi link children := .<parent[is Category];
      path: str;
      required slug: str {
        default := .name;
      }
      required level: int16 {
        default := 0;
      };

      access policy all_can_select
        allow select;
    }

    type OwnerCategory extending Category {
      required owner: api::account::Account;
      access policy category_select
      allow select
      using (select api::account::UserPermissons.UP_SELECT IN global default::api_current_user.category_permissons);

      access policy category_insert
      allow insert
      using (select api::account::UserPermissons.UP_INSERT IN global default::api_current_user.category_permissons);

      access policy product_update
      allow update
      using (select api::account::UserPermissons.UP_UPDATE IN global default::api_current_user.category_permissons);

      access policy product_delete
      allow delete
      using (select api::account::UserPermissons.UP_DELETE IN global default::api_current_user.category_permissons);

      access policy owner_has_full_access
      deny update, insert, delete
      using (
        global default::api_current_user.account.id ?!= .owner.id
        and
        global default::api_current_user.user_role ?!= api::account::AvailableRole.ADMIN
      );
    }

    type GlobalCategory extending Category {
      
    }
 
  }
}
