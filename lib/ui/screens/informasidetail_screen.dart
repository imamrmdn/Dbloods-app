part of 'screens.dart';

class InformasiDetailScreen extends StatefulWidget {
  final Informasi informasi;

  InformasiDetailScreen(this.informasi);

  @override
  _InformasiDetailScreenState createState() => _InformasiDetailScreenState();
}

class _InformasiDetailScreenState extends State<InformasiDetailScreen> {
  // ignore: prefer_collection_literals
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ].toSet();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<ScreenBloc>()
            .add(GoToMainScreen(bottomNavBarIndex: 1, initialIndex: 0));
        return;
      },
      child: WebviewScaffold(
        url: widget.informasi.url,
        appBar: AppBar(
          title: Text('${widget.informasi.url}'),
          backgroundColor: mainColor,
          leading: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                context
                    .bloc<ScreenBloc>()
                    .add(GoToMainScreen(bottomNavBarIndex: 1));
              }),
        ),
        mediaPlaybackRequiresUserGesture: false,
        scrollBar: true,
        withLocalStorage: true,
        javascriptChannels: jsChannels,
        withJavascript: true,
        hidden: true,
        withZoom: true,
        clearCache: true,
        initialChild: Loading(
          color: mainColor,
        ),
      ),
    );
  }
}
