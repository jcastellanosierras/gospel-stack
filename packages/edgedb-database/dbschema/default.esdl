module default {
  global current_user_id -> uuid;
  global current_account_id -> uuid;
  global current_user := (
    select User filter .id = global current_user_id
  );
  global api_current_user := (
    select api::account::User filter .id = global default::current_user_id
  );
  global api_current_account := (
    select api::account::Account filter .id = global default::current_account_id
  );


  scalar type UserPermissons extending enum<UP_SELECT, UP_INSERT, UP_UPDATE, UP_DELETE>;
  scalar type AvailableRole extending enum<SUPERADMIN, ADMIN, USER, SUPPLIER>;
  scalar type ProductState extending enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  scalar type BrandState extending enum<ACTIVE, INACTIVE, PENDING_REVIEW>;
  scalar type VerificationType extending enum<ONBOARDING, TWOFA, TWOFA_PENDING, FORGOT_PASSWORD>;


  abstract type DatedType {
    required created_at: datetime {
        readonly := true;
        default := datetime_current();
      }
    updated_at: datetime {
        rewrite insert, update using (datetime_of_statement())
      }

  }

  abstract type HasImages {
    multi images: Image;
  }

  abstract type HasAvatar {
    avatar: Image;
  }

  type Password extending DatedType {
    required hash: str;
    link user := .<password[is User];
    #constraint exclusive on (.user);

    access policy only_superadmin_has_access
      allow all
      using(
        global current_user.user_role ?= AvailableRole.SUPERADMIN
      );

    access policy user_can_select_and_update
    allow select, update
    using(
      global current_user ?= .user
    );
  }

  type ApiKey extending DatedType {
    required key: str {
      constraint exclusive
    };
  }

  type Session extending DatedType {
    required user: User;
    required expires_at: datetime;

    
    access policy only_superadmin_has_access
      allow all
      using(
        global current_user.user_role ?= AvailableRole.SUPERADMIN
      );

    access policy user_can_select_and_create
      allow select, insert
      using(
        global current_user.id ?= .user.id
      );
  }

  type Verification extending DatedType {
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

  access policy only_superadmin_has_access
    allow all
    using(
      global current_user.user_role ?= AvailableRole.SUPERADMIN
    );
}

  type User extending DatedType, HasAvatar {
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

    company: Company;
    
    user_role: AvailableRole {
        default := "USER";
      };
    link sessions := .<user[is Session];

    access policy admin_has_full_access
      allow all
      using(
        global current_user.user_role ?= AvailableRole.SUPERADMIN
        or
        global current_user.user_role ?= AvailableRole.ADMIN
      );

    access policy user_can_update
      allow select, update
      using(
        global current_user_id ?= .id
      );
  }

  type Company extending DatedType, HasImages, HasAvatar {
    vat: str {
      constraint exclusive;
    }
    required fiscal_name: str;
    required comercial_name: str;
    is_manufacturer: bool {
        default := false;
    };
    link users := .<company[is User];
    link brands := .<owner[is Brand];
    # link api_keys := .<company[is ApiKey];
    multi api_keys: ApiKey;

    access policy admin_has_full_access
      allow all
      using(
        global current_user.user_role ?= AvailableRole.SUPERADMIN
        or
        global current_user.user_role ?= AvailableRole.ADMIN
      );

    access policy rest_can_select
      allow select
      using(
        select true
      );
  }

  type Product extending DatedType, HasImages {

    required state: ProductState {
        default := "PENDING_REVIEW"
      }
    external_sync_id: uuid {
        annotation description := "Id global entre bases de datos sincronizadas";
        constraint exclusive;
        rewrite insert using (.id) #default := .id;
      };

    required name: str;
    required reference: str;
    ean: str {
           constraint exclusive
         };
    barcode: str {
        constraint exclusive
      };
    family: str;
    family_code: str;
    year: str;
    season: str;
    color: str;
    size: str;
    required price: float64 {
        default := 0.0;
        constraint min_value(0.0);
      };
    sale_price: float64;
    notes: str;
    #/* // ******************* Categorizacion */
    #// Para implementar cuando pensemos en las categorizacion.
    #// Podriamos prescindir de las categorias en favor de una categorizacion por propiedades
    #// gender     String // hombre , mujer, all
    #// type       String // fiesta, casual, deportivo, tecnico, vestir, 
    #// sport      String? //
    #// colorIntensity      String? // oscuro, claro
    #// colorLiminosity      String? // pastel, vivos, brillante
    #// ********************************************************* 

    owner: Company;
    brand: Brand;
    owner_category: category::OwnerCategory;
    global_category: category::GlobalCategory;

    access policy admin_has_full_access
      allow all
      using(
        global current_user.user_role ?= AvailableRole.SUPERADMIN
        or
        global current_user.user_role ?= AvailableRole.ADMIN
      );

    access policy user_from_company_has_full_access
      allow all
      using(
        global current_user.company ?= .owner
      );

    access policy rest_users_can_select
      allow select
      using(
        select true if exists (
          select User filter .id = global current_user_id
        ) else false
      )
  }

  #type Category extending DatedType, HasImages {
  #  name:
  #}

  type Brand extending DatedType, HasImages, HasAvatar {
    required state: BrandState {
        default := "PENDING_REVIEW"
      }

    required name: str {
      constraint exclusive;
    };
    required reference: str;
    description: str;

    owner: Company;
  }

  type Image extending DatedType {
    # Las imagenes estaran en un servicio que hara un resize automatico de las imagenes
    # por lo que solo hay que guardar la URL raiz de la image
    alt: str;
    description: str;
    content_type: str;
    image_service_id: str; ## Si en un futuro se implementa un servicio externo como cloudinary, filestack, cloudfare
    file: File; # TODO eliminar cuando termine la migracion

    link products := .<images[is Product];
    link brands := .<images[is Brand];
    }

  type File extending DatedType {
      required blob: bytes
    }
  

}
