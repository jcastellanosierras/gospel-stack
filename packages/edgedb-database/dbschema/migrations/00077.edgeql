CREATE MIGRATION m1zenky6uo3com5lzyh4v7pbzqlqu2ehl4e77eypoqdonqlzi3ryaa
    ONTO m1hfy3uj5i7lnxpbbgosh66yrzrfwdn2wcqfbu65efa53nyyvhf3hq
{
  ALTER TYPE category::Category {
      ALTER ACCESS POLICY all_can_select RESET EXPRESSION;
  };
};
