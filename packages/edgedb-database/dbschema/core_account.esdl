module api {

  module account {
    # Scalar types definition
    scalar type AvailableRole extending enum<ADMIN, USER>;
    scalar type UserPermissons extending enum<UP_SELECT, UP_INSERT, UP_UPDATE, UP_DELETE>;
    scalar type ApiPermissons extending enum<API_SELECT, API_INSERT, API_UPDATE, API_DELETE>;
    scalar type VerificationType extending enum<ONBOARDING, TWOFA, TWOFA_PENDING, FORGOT_PASSWORD>;

    # account types
    type Account extending default::DatedType, default::HasAvatar {
      required name: str;
      
      link brands := .<owner[is api::product::Brand];
      multi api_keys: ApiKey;

    }

    type ApiKey extending default::DatedType {
      required key: str {
        constraint exclusive
      };
      multi permissons: ApiPermissons;
    }


    type User extending default::DatedType, default::HasAvatar {
      multi category_permissons: UserPermissons;
      multi b2b_product_permissons: UserPermissons;
      multi b2c_product_permissons: UserPermissons;
      multi client_product_permissons: UserPermissons;
      required email: str {
        constraint exclusive;
      }
      required username: str {
        constraint exclusive;
      }
      required password: Password {
          constraint exclusive;
      };

      name: str;
      active: bool;

      account: Account;
      
      user_role: AvailableRole {
          default := "USER";
        };
      link sessions := .<user[is Session];

      access policy admin_has_full_access
        allow all
        using(
          global default::api_current_user.user_role ?= AvailableRole.ADMIN
        );

      access policy user_can_update
        allow select, update
        using(
          global default::current_user_id ?= .id
        );
    }

    type Password extending default::DatedType {
      required hash: str;
      link user := .<password[is User];
      #constraint exclusive on (.user);

      access policy only_admin_has_access
        allow all
        using(
          global default::api_current_user.user_role ?= AvailableRole.ADMIN
        );

      access policy user_can_select_and_update
      allow select, update
      using(
        global default::api_current_user ?= .user
      );
    }

    type Session extending default::DatedType {
      required user: User;
      required expires_at: datetime;

      
      access policy only_admin_has_access
        allow all
        using(
          global default::api_current_user.user_role ?= AvailableRole.ADMIN
        );

      access policy user_can_select_and_create
        allow select, insert
        using(
          global default::api_current_user.id ?= .user.id
        );
    }

    type Verification extending default::DatedType {
      # The type of verification, e.g. "email" or "phone"
      required ttype: VerificationType; 

      # The thing we're trying to verify, e.g. a user's email or phone number
      required ttarget: str;

      # The secret key used to generate the otp
      required secret: str;

      # The algorithm used to generate the otp
      required algorithm: str;

      # The number of digits in the otp
      required digits: int64;

      # The number of seconds the otp is valid for
      required period: int64;

      # When it's safe to delete this verification
      property expires_at := .created_at + <duration>(<str>.period ++ ' seconds');
      constraint exclusive on ((.ttarget, .ttype));

      access policy only_admin_has_access
        allow all
        using(
          global default::api_current_user.user_role ?= AvailableRole.ADMIN
        );
      }



  }
}
