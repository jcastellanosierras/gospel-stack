CREATE MIGRATION m1sxox6hdzb27zsqiwxtcwe3ohhaqd7tlrvnksq733hq3mfbqathza
    ONTO m1364llylssrzsval7kmb3qisb7v6ntkgpp6mo6c4ujjg5zvk7n4ra
{
  ALTER SCALAR TYPE default::VerificationType EXTENDING enum<ONBOARDING, TWOFA, TWOFA_PENDING, FORGOT_PASSWORD>;
};
