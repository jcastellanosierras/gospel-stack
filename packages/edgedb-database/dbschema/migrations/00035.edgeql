CREATE MIGRATION m13u3ifc6ratgkmzyf5qchpcue5o6km256rc3vhnmv4jnb67rogwka
    ONTO m1jfjilgl7ueui565ha7yccbf6garxpxpdwnhyqmnsn425m377ymjq
{
  ALTER TYPE category::OwnerCategory {
      DROP ACCESS POLICY category_insert;
      DROP ACCESS POLICY category_select;
      DROP ACCESS POLICY product_delete;
      DROP ACCESS POLICY product_update;
  };
  ALTER SCALAR TYPE default::UserPermissons EXTENDING enum<UP_SELECT, UP_INSERT, UP_UPDATE, UP_DELETE>;
};
