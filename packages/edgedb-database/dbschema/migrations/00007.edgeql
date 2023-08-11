CREATE MIGRATION m1sze3xtqnmdqikwnwiefjjnlud7efo4znbou7riojdialg72f54za
    ONTO m1z7xnkjogv4kf34ipx7rek4zmrs7sao4g4jdx46j6vjwtpwhohveq
{
  ALTER TYPE default::Company EXTENDING default::HasAvatar LAST;
};
