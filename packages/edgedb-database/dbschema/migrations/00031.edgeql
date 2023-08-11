CREATE MIGRATION m16u5dlkugvq55l6okfbw4etwj4opaa53rofwgr6aswap2bucxnpba
    ONTO m1ppfy4m32xwxmzsyrn5ophvfz6bv3in7ktdjj7nr3pkkfyukemeqa
{
  ALTER TYPE category::Category {
      ALTER PROPERTY level {
          USING (std::count(.parents));
      };
      DROP LINK ancestors;
  };
};
