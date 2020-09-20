part of 'screens.dart';

class EventDetailScreen extends StatelessWidget {
  final EventDonor eventDonor;

  EventDetailScreen(this.eventDonor);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToMainScreen(bottomNavBarIndex: 0));
        return;
      },
      child: Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          child: Container(
            color: whiteColor,
            width: SizeConfig.defaultWidth,
            height: SizeConfig.defaultHeight,
            child: ListView(
              children: <Widget>[
                //noted: gambar
                Container(
                  width: SizeConfig.defaultWidth,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(eventDonor.gambar),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    width: SizeConfig.defaultWidth,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          whiteColor.withOpacity(0.5),
                          Colors.black.withOpacity(0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //noted: title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      itemTop(),
                      SizedBox(height: 180),
                      itemBottom(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          eventDonor.title,
          style: blackTextFont.copyWith(fontSize: 20),
          textAlign: TextAlign.left,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20),
        Divider(),
        //noted: deskripsi event donor
        Text('Deskripsi Event:', style: blackTextFont.copyWith(fontSize: 16)),
        SizedBox(height: 20),
        Text(
          eventDonor.deskripsi,
          style: blackTextFont.copyWith(fontWeight: FontWeight.w200),
          textAlign: TextAlign.justify,
        ),
        //noted: pilih jam Event
        SizedBox(height: 20),
        Text('Pilih Jam Event:', style: blackTextFont.copyWith(fontSize: 16)),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: borderRadius5,
                border: Border.all(color: blackColor),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: borderRadius5,
                border: Border.all(color: blackColor),
              ),
            ),
          ],
        ),
      ],
    );
  }

  itemBottom(BuildContext context) {
    return ButtonNext(
      onPressed: () {
        //todo: mendapat donor id
        // context.bloc<ScreenBloc>().add(GoToGetDonorIdScreen(eventDonor));
      },
    );
  }
}
