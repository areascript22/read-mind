import 'package:client_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:share_plus/share_plus.dart';

abstract interface class ShareService {
  Future<Either<Failure, String>> shareText(String text);
}

class ShareServiceImpl implements ShareService {
  @override
  Future<Either<Failure, String>> shareText(String text) async {
    try {
      String inviteMessage =
          '📚 ¡Te invito a unirte a mi curso!\n'
          'Usa el siguiente código de invitación para inscribirte en la app: \n$text';
      final result = await Share.share(inviteMessage);
      return right(result.status.name);
    } catch (e) {
      return left(Failure("Compartir no disponible"));
    }
  }
}
