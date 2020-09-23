part of 'screens.dart';

class GetDonorIdScreen extends StatelessWidget {
  final EventId eventId;

  GetDonorIdScreen(this.eventId);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return showDialog(
            context: context,
            builder: (_) {
              return AlertDialogAnimation2(
                image: Image.asset(
                  'assets/question.png',
                  width: 250,
                  height: 130,
                ),
                onPressed1: () {
                  Navigator.pop(context);
                },
                onPressed2: () {
                  Navigator.pop(context);
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToEventDetailScreen(eventId.eventDonor));
                },
                message:
                    'Apakah kamu yakin ingin mengganti event? atau mengganti jam event?',
              );
            });
      },
      child: Container(
        color: mainColor,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: whiteColor,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: SizeConfig.defaultWidth,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius10,
                          image: DecorationImage(
                              image: NetworkImage(eventId.eventDonor.gambar),
                              fit: BoxFit.cover)),
                    ),
                    Divider(color: mainColor, height: 50),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('DONOR ID:', style: blackTextFont),
                        Text('${eventId.donorId}',
                            style: blackTextFont.copyWith(
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Tanggal & Jam:', style: blackTextFont),
                        Text(
                            '${formatDate2(eventId.eventDonor.tanggalEvent)}, ${eventId.jamEvent}',
                            style: blackTextFont)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Tempat Event:', style: blackTextFont),
                        Text('${eventId.eventDonor.alamat}',
                            style: blackTextFont)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Nama Pendonor:', style: blackTextFont),
                        Text('${eventId.nama}', style: blackTextFont)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Jenis Kelamin:', style: blackTextFont),
                        Text('${eventId.jenkel}', style: blackTextFont)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Pekerjaan:', style: blackTextFont),
                        Text('${eventId.pekerjaan}', style: blackTextFont)
                      ],
                    ),
                    Divider(color: mainColor, height: 50),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Yeay kamu ikut berpartisipasi di kegiatan ${eventId.eventDonor.title}',
                            style: blackTextFont,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (_, userState) {
                        User user = (userState as UserLoaded).user;
                        return ButtonNext(
                          text: 'Ikut Berpartisipasi',
                          onPressed: () {
                            //todo Succes screen
                            EventIdTransaction transaction = EventIdTransaction(
                              userID: user.id,
                              title: eventId.eventDonor.title,
                              subtitle: eventId.eventDonor.alamat,
                              time: DateTime.now(),
                              picture: eventId.eventDonor.gambar,
                            );
                            context
                                .bloc<ScreenBloc>()
                                .add(GoToSuccesScreen(eventId, transaction));
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
