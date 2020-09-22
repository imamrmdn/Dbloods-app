part of 'screens.dart';

class EventDetailScreen extends StatefulWidget {
  final EventDonor eventDonor;

  EventDetailScreen(this.eventDonor);

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  DateTime selectedDate;
  int selectTime;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    // print(DateTime.now().day);
    // print(int.parse(
    //     formatDate2(widget.eventDonor.tanggalEvent).split('-').first));
    // print(selectedDate.day);
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
                      image: NetworkImage(widget.eventDonor.gambar),
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
          widget.eventDonor.title,
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
          widget.eventDonor.deskripsi,
          style: blackTextFont.copyWith(fontWeight: FontWeight.w200),
          textAlign: TextAlign.justify,
        ),
        //noted: pilih jam Event
        SizedBox(height: 20),
        Text('Pilih Jam Event yang kamu mau:',
            style: blackTextFont.copyWith(fontSize: 16)),
        SizedBox(height: 20),
        //
        generateTimeTable(),
      ],
    );
  }

  itemBottom(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return ButtonNext(
          color: (isValid) ? mainColor : greyColor,
          text: 'Selanjutnya',
          onPressed: () {
            //todo: mendapat donor id
            if (isValid) {
              context.bloc<ScreenBloc>().add(
                    GoToGetDonorIdScreen(
                      EventId(
                        widget.eventDonor,
                        randomAlphaNumeric(14).toUpperCase(),
                        '$selectTime:00',
                        (userState as UserLoaded).user.nama,
                        (userState as UserLoaded).user.jenkel,
                        (userState as UserLoaded).user.pekerjaan,
                      ),
                    ),
                  );
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialogAnimation(
                  image: Image.asset(
                    'assets/time.png',
                    width: 250,
                    height: 130,
                  ),
                  message:
                      'Anda Belum Memilih Jam Event\nSilahkan Pilih Jam Event Terlebih Dahulu.',
                ),
              );
            }
          },
        );
      },
    );
  }

  generateTimeTable() {
    List<int> jadwal = List.generate(5, (index) => 9 + index * 2);
    List<Widget> widgets = [];
    int _eventDay =
        int.parse(formatDate2(widget.eventDonor.tanggalEvent).split('-').first);

    widgets.add(
      Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: jadwal.length,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.only(
                left: (index == 0) ? 0 : 0,
                right: (index < jadwal.length - 1) ? 16 : 24,
              ),
              child: SelectableBox(
                '${jadwal[index]}:00',
                isSelected: selectTime == jadwal[index],
                isEnabled: jadwal[index] > DateTime.now().hour ||
                    _eventDay != DateTime.now().day,
                onTap: () {
                  // print(jadwal[index]);
                  setState(() {
                    selectTime = jadwal[index];
                    if (jadwal[index] > DateTime.now().hour ||
                        _eventDay != DateTime.now().day) {
                      isValid = true;
                    } else {
                      isValid = false;
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
    );

    return Column(
      children: widgets,
    );
  }
}
