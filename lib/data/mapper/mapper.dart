import 'package:store_app_advanced/app/constants.dart';
import 'package:store_app_advanced/app/extensions.dart';
import 'package:store_app_advanced/data/response/responses.dart';
import 'package:store_app_advanced/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numberOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orZero() ?? Constants.zero,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthentecationResponse? {
  Authentecation toDomain() {
    return Authentecation(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}
