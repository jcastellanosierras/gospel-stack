CREATE MIGRATION m1dzf26axgysyelsua52oxlmdkevycqiptmklzmp5q4kdnctqfksqq
    ONTO m1pq47zfvwz2cfhrr5zbkkeahle6ngql3wugx7kdb3luvq6goxldaq
{
  ALTER TYPE category::OwnerCategory {
      EXTENDING common::HasCompanyOwner LAST;
      ALTER LINK owner {
          RESET OPTIONALITY;
          DROP OWNED;
          RESET TYPE;
      };
  };
};
