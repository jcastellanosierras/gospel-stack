CREATE MIGRATION m1g7ge4zqaejpvbdakg6can4fllqhzhjzg33bj2lefeolrhgjjm2aa
    ONTO m1vdxs6vhaqpxuhteay6cshcymgo2zxf25f75faxkjgkl6t7uj73ea
{
  ALTER TYPE default::Image {
      ALTER LINK file {
          RESET OPTIONALITY;
      };
      ALTER PROPERTY content_type {
          RESET OPTIONALITY;
      };
      CREATE PROPERTY image_service_id: std::str;
  };
};
