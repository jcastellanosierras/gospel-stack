CREATE MIGRATION m144drjpfljazkybxbovo7rsl4kg4pcf2essxr3obfu6hbfq7lzvqa
    ONTO m1vfxwaqrpvpfm55c6smygqqtgj53f6yuzv2r7xdlggljhevjvtfoq
{
  ALTER GLOBAL api::account::current_user RENAME TO default::api_current_user;
};
