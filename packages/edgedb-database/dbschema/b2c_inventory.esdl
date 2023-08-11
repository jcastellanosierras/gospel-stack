module b2c {
  module inventory {
    scalar type ProductState extending enum<ACTIVE, INACTIVE, PENDING_REVIEW>;

    type Product extending default::DatedType, default::HasImages, common::HasCompanyOwnerPrivate {
      required name: str;
      reference: str;
      ean: str;
      barcode: str;
      family: str;
      family_code: str;
      year: str;
      season: str;
      color: str;
      size: str;
      sale_price: float64;
      notes: str;
      stock_sync: bool;
      state: ProductState;

      #master: default::Product; // Se debe usar el EAN como codigo universal para sincronizar tanto con la BD de proveedores como con la BD
      brand: default::Brand;
      owner_category: category::OwnerCategory;
      global_category: category::GlobalCategory;

      link stock := .<product[is Stock];
      property stock_qty := .stock.quantity;


      access policy product_select
      allow select
      using (select default::UserPermissons.UP_SELECT IN global default::current_user.b2c_product_permissons);

      access policy product_insert
      allow insert
      using (select default::UserPermissons.UP_INSERT IN global default::current_user.b2c_product_permissons);

      access policy product_update
      allow update
      using (select default::UserPermissons.UP_UPDATE IN global default::current_user.b2c_product_permissons);

      access policy product_delete
      allow delete
      using (select default::UserPermissons.UP_DELETE IN global default::current_user.b2c_product_permissons);

    }

    type Stock {
      required product: Product;
      required quantity: float64 {
          constraint min_value(0)
      };

      constraint exclusive on ((.product));

      trigger log_stock_modifications after insert for each do (
          insert b2c::inventory::StockLog {
            action := "insert",
            product := __new__.product,
            quantity := <str>__new__.quantity,
            #user := (select default::User filter .id=<uuid>default::current_user_id)
            #user := default::current_user
          }
      );

      trigger log_stock_updates_modifications after update for each do (
          insert b2c::inventory::StockLog {
            action := "update",
            product := __new__.product,
            quantity := <str>__new__.quantity,
            #user := (select default::User filter .id=<uuid>default::current_user_id)
            #user := default::current_user
          }
      );
      

    }

    type StockLog {
      #required user: default::User;
      required action: str;
      required quantity: str;
      required product: b2c::inventory::Product;
      change: str;
      timestamp: datetime {
        rewrite insert using (datetime_of_statement());
      };
    }
  }
}
