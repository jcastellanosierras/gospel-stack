CREATE MIGRATION m1pq47zfvwz2cfhrr5zbkkeahle6ngql3wugx7kdb3luvq6goxldaq
    ONTO m1q4x7zz5h2armfd64gm7mh7kal2rpaxc7mdlgz7ziibfc6xvbmmiq
{
  ALTER TYPE common::AdminRoleHasFullAccess RENAME TO common::AdminRoleHasFullAccessAccessPolicy;
  ALTER TYPE category::Category EXTENDING common::AdminRoleHasFullAccessAccessPolicy LAST;
};
