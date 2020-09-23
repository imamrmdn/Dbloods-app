part of 'screens.dart';

class RiwayatDonorScreen extends StatefulWidget {
  @override
  _RiwayatDonorScreenState createState() => _RiwayatDonorScreenState();
}

class _RiwayatDonorScreenState extends State<RiwayatDonorScreen> {
  bool isExpiredEventId = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<ScreenBloc>().add(GoToMainScreen(bottomNavBarIndex: 3));
        return;
      },
      child: Container(
        color: mainColor,
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                //note: content
                BlocBuilder<EventidBloc, EventidState>(
                  builder: (_, eventIdState) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      //
                      child: EventIdView(isExpiredEventId
                          ? eventIdState.eventId
                              .where((eventId) =>
                                  !eventId.time.isBefore(DateTime.now()))
                              .toList()
                          : eventIdState.eventId
                              .where((eventId) =>
                                  eventId.time.isBefore(DateTime.now()))
                              .toList()),
                    );
                  },
                ),
                //note: header
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: mainColor,
                  width: SizeConfig.defaultWidth,
                  height: 115,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(MdiIcons.heartBox, color: whiteColor),
                          SizedBox(width: 5),
                          Text('Riwayat Donormu',
                              style: whiteTextFont.copyWith(fontSize: 18)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print('riwayat baru');
                                  setState(() {
                                    isExpiredEventId = !isExpiredEventId;
                                  });
                                },
                                child: Text(
                                  'Terbaru',
                                  style: whiteTextFont.copyWith(
                                    fontSize: 18,
                                    color: !isExpiredEventId
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width * 0.5,
                                color: !isExpiredEventId
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print('riwayat lama');
                                  setState(() {
                                    isExpiredEventId = !isExpiredEventId;
                                  });
                                },
                                child: Text('Lama',
                                    style: whiteTextFont.copyWith(
                                      fontSize: 18,
                                      color: isExpiredEventId
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 4,
                                width: MediaQuery.of(context).size.width * 0.5,
                                color: isExpiredEventId
                                    ? Colors.blue
                                    : Colors.transparent,
                              ),
                            ],
                          ),
                        ],
                      ),
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
}

//
class EventIdView extends StatelessWidget {
  final List<EventId> eventId;

  EventIdView(this.eventId);

  @override
  Widget build(BuildContext context) {
    var sortedEventId = eventId;
    sortedEventId.sort((event1, event2) => event1.time.compareTo(event2.time));

    return ListView.builder(
      itemCount: sortedEventId.length,
      itemBuilder: (_, index) {
        return Container(
          margin: EdgeInsets.only(top: index == 0 ? 140 : 30),
          child: InkWell(
            onTap: () {
              print('ssss');
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              QrImage(
                                data: sortedEventId[index].donorId,
                                version: QrVersions.auto,
                                size: 150,
                              ),
                              SizedBox(height: 10),
                              Text('Scan Barcode Mu'),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 80,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius8,
                        image: DecorationImage(
                          image: NetworkImage(
                              sortedEventId[index].eventDonor.gambar),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 -
                              20 -
                              80 -
                              611,
                          child: Text(
                            sortedEventId[index].eventDonor.title,
                            style: blackTextFont,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          '${formatDate2(sortedEventId[index].eventDonor.tanggalEvent)}, Jam ${sortedEventId[index].jamEvent}',
                          style: blackTextFont,
                        ),
                      ],
                    ),
                  ],
                ),
                QrImage(
                  data: sortedEventId[index].donorId,
                  version: QrVersions.auto,
                  size: 80,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
