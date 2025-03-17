import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield_test/features/collection/presentation/bloc/collection_bloc.dart';
import 'package:pixelfield_test/splash_screen_view.dart';

import 'injectables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CollectionBloc>()..add(GetAllCollectionEvent()),
        ),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: (MediaQuery.of(context).size.width < 700 &&
                MediaQuery.of(context).size.width > 635)
            ? const Size(480, 892)
            : MediaQuery.of(context).size.width < 400
                ? const Size(412, 892)
                : MediaQuery.of(context).size.width < 450
                    ? const Size(500, 892)
                    : MediaQuery.of(context).size.width < 650
                        ? const Size(445, 892)
                        : MediaQuery.of(context).size.width > 700
                            ? const Size(612, 1024)
                            : const Size(768, 1024),
        builder: (contextMain, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
