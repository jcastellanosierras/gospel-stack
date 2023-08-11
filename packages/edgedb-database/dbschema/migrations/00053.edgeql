CREATE MIGRATION m1koctgouwvi52l7gm3wvwz7xsjff2cf26asabztla6iao6qq3qtiq
    ONTO m1vowytxzxauho7ivn523ybfui4ydvivbmrolrlkxsy5hnlimoiqoa
{
  CREATE SCALAR TYPE b2c::inventory::ProductState EXTENDING enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  ALTER TYPE b2c::inventory::Product {
      CREATE PROPERTY state: b2c::inventory::ProductState;
      CREATE PROPERTY stock_sync: std::bool;
  };
};
