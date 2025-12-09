import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ctoshackcity/views/bootAnimation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ctoshackcity/blocs/products/products_bloc.dart';
import 'package:ctoshackcity/repository/purchase_repository.dart';
import 'package:ctoshackcity/game/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PurchaseRepository>(
            create: (context) => PurchaseRepository()
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PurchaseBloc>(create: (context)=>PurchaseBloc(
              purchaseRepository: RepositoryProvider.of<PurchaseRepository>(context)
          ))
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp(debugShowCheckedModeBanner: false, builder: (context, child){
              return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling, boldText: false), child: SafeArea(child: child!));
            }, home: //Game()
              bootAnimation()
            );
          }
        ),
      ),
    );
  }
}
