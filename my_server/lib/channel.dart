import 'my_server.dart';
import 'dart:math';
import 'package:sqljocky5/sqljocky.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class MyServerChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/users/[:id]").link(()=>MyController());
      ;

    return router;
  }
}
class MyController extends ResourceController {
  final List<String> things = ['zjy','tlw','ljy','wse','cxr','ldk','zjx','qxy','zkx','cy','zsy','zzh'];
 static var random = Random();
  var number=random.nextInt(12);

  @Operation.get()
  Future<Response> getThings() async {
    return Response.ok(things[number]);
  }

  @Operation.get('id')
  Future<Response> getThing(@Bind.path('id') int id) async {
    if (id < 0 || id >= things.length) {
      return Response.notFound();
    }
    return Response.ok(things[id]);
  }
  Future connect(List<String> names) async{
  var s = ConnectionSettings(
    user: "deit2016",
    password: "deit2016@ecnu",
    host: "www.muedu.org",
    port: 3306,
    db: "deit2016db_10164507110",
  );
    print("openning connection......");
  var conn = await MySqlConnection.connect(s);
  print("opened......");
  Results result =
      await conn.execute('SELECT sid,sname, FROM stu_infor');
  result.forEach( (f) => names.add(f.toString()) );
}
}