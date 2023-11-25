import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:wsc_auth/wsc_auth.dart';

void main() {
  WSCAuth.initializeApp(baseURL: 'http://38.242.214.3:8055/');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OAuthCubit>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'WSC Auth Example'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Center(
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () => BlocProvider.of<OAuthCubit>(context).authorize(
                    OAuthDTO(
                        grantType: 'password',
                        clientId: 'Hudoor_App',
                        scope: 'Hudoor',
                        username: 'abdelrhman.ismail@wscdev.net',
                        password: '1q2w3E*')),
                child: const Text('Authorize')))
      ],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<OAuthCubit, OAuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is OAuthSuccess)
                  Text(
                    state.token,
                  ),
                if (state is OAuthLoading)
                  const CircularProgressIndicator.adaptive(),
                if (state is OAuthFailed) Text(state.error)
              ],
            ),
          );
        },
      ),
    );
  }
}
