# NOTA: Las access policies de roles y las abstractas que dan permisos sobre un campo , para que sean combinables con la capa de permisos deben
# - Aplicarse como clausulas deny.
# - Incluir dentro de la clausula 'deny' los permisos de los roles que queramos que tengan acceso independientemente de los permisos.
# Si no se hace asi pueden dar lugar a incoherencias, por ejemplo la que da permisos al acceso a modificar una OwnerCategory. 
# - Si no lo hicieramos con una clausula deny todo usuario de la compania tendria acceso a modificar ya que el permiso seria 'allow all'
# - Si no metiramos los permisos de usuario y del superusuario dentro de la clausula deny, como esta denegandose en esa clausula no habria clausula que 
# permitiera renovar ese permiso.

module common {
  abstract type HasUserOwner {
    required owner: default::User;
    access policy owner_has_full_access
    deny update, insert, delete
    using (
      global default::current_user_id ?!= .owner.id
      or
      global default::current_user.user_role ?!= default::AvailableRole.SUPERADMIN
      or
      global default::current_user.user_role ?!= default::AvailableRole.ADMIN
    );
  }  

  abstract type HasCompanyOwner {
    required owner: default::Company;
    access policy owner_has_full_access
    deny update, insert, delete
    using (
      global default::current_user.company.id ?!= .owner.id
      and
      global default::current_user.user_role ?!= default::AvailableRole.SUPERADMIN
      and
      global default::current_user.user_role ?!= default::AvailableRole.ADMIN
    );
  }

  abstract type HasCompanyOwnerPrivate {
    required owner: default::Company;
    access policy owner_has_full_access
    deny select, update, insert, delete
    using (
      global default::current_user.company.id ?!= .owner.id
    );
  }

  abstract type HasUserOwnerPrivate {
    required owner: default::User;
    access policy owner_has_full_access
    deny select, update, insert, delete
    using (
      global default::current_user_id ?!= .owner.id
    );
  }

  abstract type AdminRoleHasFullAccessAccessPolicy {
    access policy admin_has_full_access
      allow all
      using(
        global default::current_user.user_role ?= default::AvailableRole.SUPERADMIN
        or
        global default::current_user.user_role ?= default::AvailableRole.ADMIN
      );
  }

  #type Log {
  #  required action: str;
  #  required target_name: str;
  #  ttype: str;
  #  timestamp: datetime {
  #    rewrite insert using (datetime_of_statement());
  #  }
  #};

}
