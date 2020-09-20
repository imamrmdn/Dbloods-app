part of 'screens.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToMainScreen(bottomNavBarIndex: 3));
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context
                    .bloc<ScreenBloc>()
                    .add(GoToMainScreen(bottomNavBarIndex: 3));
              }),
          backgroundColor: mainColor,
          title: Text('Tentang Aplikasi'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('assets/about_app.png'),
            Expanded(
              child: ListView.builder(
                itemCount: DataSource.faq.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: <Widget>[
                      Theme(
                        data: Theme.of(context).copyWith(
                            accentColor: mainColor,
                            unselectedWidgetColor: greyColor),
                        child: ExpansionTile(
                          title: Text(
                            DataSource.faq[i]['pertanyaan'],
                            style: blackTextFont,
                          ),
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DataSource.faq[i]['jawaban'],
                                style: blackTextFont,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
