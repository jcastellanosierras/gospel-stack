CREATE MIGRATION m1ytsb2teailpe2xqvcyerc7nswvlfzwe553yw2rfnmzbeuhbsbs7a
    ONTO initial
{
  CREATE ABSTRACT TYPE default::DatedType {
      CREATE PROPERTY created_at: std::datetime {
          SET default := (std::datetime_current());
          SET readonly := true;
      };
      CREATE PROPERTY updated_at: std::datetime;
  };
  CREATE SCALAR TYPE default::BrandState EXTENDING enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  CREATE ABSTRACT TYPE default::HasImages;
  CREATE TYPE default::Brand EXTENDING default::DatedType, default::HasImages {
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE REQUIRED PROPERTY reference: std::str;
      CREATE REQUIRED PROPERTY state: default::BrandState {
          SET default := 'PENDING_REVIEW';
      };
  };
  CREATE TYPE default::File EXTENDING default::DatedType {
      CREATE REQUIRED PROPERTY blob: std::bytes;
  };
  CREATE TYPE default::Image EXTENDING default::DatedType {
      CREATE REQUIRED LINK file: default::File;
      CREATE PROPERTY alt: std::str;
      CREATE REQUIRED PROPERTY content_type: std::str;
      CREATE PROPERTY description: std::str;
  };
  ALTER TYPE default::HasImages {
      CREATE MULTI LINK images: default::Image;
  };
  ALTER TYPE default::Image {
      CREATE LINK brands := (.<images[IS default::Brand]);
  };
  CREATE TYPE default::Company EXTENDING default::DatedType, default::HasImages {
      CREATE REQUIRED PROPERTY comercial_name: std::str;
      CREATE REQUIRED PROPERTY fiscal_name: std::str;
      CREATE PROPERTY is_manufacturer: std::bool {
          SET default := false;
      };
      CREATE PROPERTY vat: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::Brand {
      CREATE LINK owner: default::Company;
  };
  CREATE ABSTRACT TYPE default::HasAvatar {
      CREATE LINK avatar: default::Image;
  };
  CREATE SCALAR TYPE default::AvailableRole EXTENDING enum<SUPERADMIN, ADMIN, USER, SUPPLIER>;
  CREATE TYPE default::User EXTENDING default::DatedType, default::HasAvatar {
      CREATE LINK company: default::Company;
      CREATE PROPERTY active: std::bool;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY user_role: default::AvailableRole {
          SET default := 'USER';
      };
      CREATE REQUIRED PROPERTY username: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::Company {
      CREATE LINK users := (.<company[IS default::User]);
  };
  CREATE SCALAR TYPE default::ProductState EXTENDING enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  CREATE TYPE default::Product EXTENDING default::DatedType, default::HasImages {
      CREATE LINK owner: default::Company;
      CREATE PROPERTY barcode: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY color: std::str;
      CREATE PROPERTY external_sync_id: std::uuid {
          CREATE ANNOTATION std::description := 'Id global entre bases de datos sincronizadas';
          CREATE CONSTRAINT std::exclusive;
          CREATE REWRITE
              INSERT 
              USING (.id);
      };
      CREATE PROPERTY family: std::str;
      CREATE PROPERTY family_code: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY notes: std::str;
      CREATE REQUIRED PROPERTY price: std::float64 {
          SET default := 0.0;
          CREATE CONSTRAINT std::min_value(0.0);
      };
      CREATE REQUIRED PROPERTY reference: std::str;
      CREATE PROPERTY sale_price: std::float64;
      CREATE PROPERTY season: std::str;
      CREATE PROPERTY size: std::str;
      CREATE REQUIRED PROPERTY state: default::ProductState {
          SET default := 'PENDING_REVIEW';
      };
      CREATE PROPERTY year: std::str;
  };
  CREATE TYPE default::Password EXTENDING default::DatedType {
      CREATE REQUIRED PROPERTY hash: std::str;
  };
  CREATE TYPE default::Session EXTENDING default::DatedType {
      CREATE REQUIRED LINK user: default::User;
      CREATE PROPERTY expiration_date: std::datetime;
  };
  CREATE SCALAR TYPE default::VerificationType EXTENDING enum<PHONE, EMAIL, TWOFA, TWOFA_PENDING>;
  CREATE TYPE default::Verification EXTENDING default::DatedType {
      CREATE REQUIRED PROPERTY ttarget: std::str;
      CREATE REQUIRED PROPERTY ttype: default::VerificationType;
      CREATE CONSTRAINT std::exclusive ON ((.ttarget, .ttype));
      CREATE REQUIRED PROPERTY algorithm: std::str;
      CREATE REQUIRED PROPERTY period: std::int64;
      CREATE PROPERTY expires_at := ((.created_at + <std::duration>(<std::str>.period ++ ' seconds')));
      CREATE REQUIRED PROPERTY digits: std::int64;
      CREATE REQUIRED PROPERTY secret: std::str;
  };
  ALTER TYPE default::Image {
      CREATE LINK products := (.<images[IS default::Product]);
  };
  ALTER TYPE default::User {
      CREATE REQUIRED LINK password: default::Password {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE LINK sessions := (.<user[IS default::Session]);
  };
  ALTER TYPE default::Password {
      CREATE LINK user := (.<password[IS default::User]);
  };
};
