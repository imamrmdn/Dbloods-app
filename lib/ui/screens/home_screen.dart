part of 'screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeTheme().init(context);
    return Stack(
      children: <Widget>[
        //
        profilePictureAndName(context),
        //list jadwal atau event
        listOfEventDonor(context),
        //heading jaddwal atau event
        headingJadwalAtauEvent(context),
        //line
        divider(),
      ],
    );
  }

  profilePictureAndName(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
      width: SizeConfig.defaultWidth,
      height: SizeConfig.defaultHeight,
      color: mainColor,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (_, userState) {
          if (userState is UserLoaded) {
            if (imageFileToUpload != null) {
              uploadImage(imageFileToUpload).then((downloadURL) {
                imageFileToUpload = null;
                context
                    .bloc<UserBloc>()
                    .add(UpdateData(profileImage: downloadURL));
              });
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(3.0),
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: whiteColor, width: 1),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Loading(color: blackColor),
                      Container(
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: (userState.user.profilePicture == "")
                                ? AssetImage('assets/user_profile.png')
                                : NetworkImage(userState.user.profilePicture),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: SizeConfig.defaultWidth -
                          2.0 * 30.0 -
                          65.0 -
                          12.0 -
                          20.0,
                      child: Text('Selamat Datang, ${userState.user.nama}',
                          style: whiteTextFont.copyWith(
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.clip),
                    ),
                    Text('Mau ikut event donor atau cari stok darah?',
                        style:
                            whiteTextFont.copyWith(fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            );
          } else {
            return Align(
              alignment: Alignment.topCenter,
              child: Loading2(
                height: 75.0,
                width: 75.0,
                color: whiteColor,
              ),
            );
          }
        },
      ),
    );
  }

  headingJadwalAtauEvent(context) {
    return Container(
      margin: EdgeInsets.only(top: 103),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(50),
          topRight: const Radius.circular(50),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        child: Row(
          children: <Widget>[
            Text(
              'Jadwal atau Event Donor',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  //list of event donor
  listOfEventDonor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 182, bottom: 70),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: SizeConfig.defaultHeight,
      width: SizeConfig.defaultWidth,
      color: whiteColor,
      child: RefreshIndicator(
        color: mainColor,
        onRefresh: () async {
          context.bloc<EventdonorBloc>().add(FetchEventDonor());
          await Future.delayed(Duration(seconds: 2));
          return;
        },
        child: BlocBuilder<EventdonorBloc, EventdonorState>(
          builder: (_, eventDonorState) {
            if (eventDonorState is EventDonorLoaded) {
              List<EventDonor> eventDonor = eventDonorState.eventDonor;
              if (eventDonor == null ||
                  eventDonor.isEmpty ||
                  eventDonor == []) {
                return noDataYet('Belum Ada Jadwal Event Donor Bulan Ini');
              }
              return ListView.builder(
                itemCount: eventDonor.length,
                itemBuilder: (context, i) {
                  return EventCard(
                    eventDonor: eventDonor[i],
                  );
                },
              );
            } else {
              return LoadingShimmerEvent();
            }
          },
        ),
      ),
    );
  }

  divider() {
    return Container(
      margin: EdgeInsets.only(
        top: SizeTheme.sizekVertical * 18,
      ),
      child: Divider(),
    );
  }
}
