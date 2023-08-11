CREATE MIGRATION m1364llylssrzsval7kmb3qisb7v6ntkgpp6mo6c4ujjg5zvk7n4ra
    ONTO m1ytsb2teailpe2xqvcyerc7nswvlfzwe553yw2rfnmzbeuhbsbs7a
{
  ALTER SCALAR TYPE default::VerificationType EXTENDING enum<PHONE, EMAIL, TWOFA, TWOFA_PENDING, FORGOT_PASSWORD>;
};
