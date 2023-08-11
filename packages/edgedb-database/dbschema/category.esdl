module category {

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

  type OwnerCategory extending Category, common::HasCompanyOwner {
    access policy category_select
    allow select
    using (select default::UserPermissons.UP_SELECT IN global default::current_user.category_permissons);

    access policy category_insert
    allow insert
    using (select default::UserPermissons.UP_INSERT IN global default::current_user.category_permissons);

    access policy product_update
    allow update
    using (select default::UserPermissons.UP_UPDATE IN global default::current_user.category_permissons);

    access policy product_delete
    allow delete
    using (select default::UserPermissons.UP_DELETE IN global default::current_user.category_permissons);
  }

  type GlobalCategory extending Category {
    
  }
}
