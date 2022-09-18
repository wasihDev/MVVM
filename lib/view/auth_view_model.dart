import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_folderstructure/repository/auth_repo.dart';
import 'package:provider_folderstructure/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRapo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRapo.loginAPi(data).then((value) {
      setLoading(true);

      // Utils.flushbarErrorMsg('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      setLoading(false);

      if (kDebugMode) {
        Utils.flushbarSuccessfulMsg('Login Successfully', context);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushbarErrorMsg(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
