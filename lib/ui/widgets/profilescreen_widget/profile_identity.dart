part of '../widgets.dart';

class ProfileIdentity extends StatelessWidget {
  final String nama;
  final String golDarah;
  final String email;
  final String umur;

  ProfileIdentity({this.nama, this.golDarah, this.email, this.umur});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.defaultWidth,
      height: SizeConfig.defaultHeight,
      color: mainColor,
      child: Container(
        margin: EdgeInsets.only(top: SizeTheme.sizekVertical * 11.1), //104
        padding: EdgeInsets.only(
            top: SizeTheme.sizekVertical * 14,
            left: SizeTheme.sizeHorizontal * 5,
            right: SizeTheme.sizeHorizontal * 5),
        width: SizeConfig.defaultWidth,
        height: SizeConfig.defaultHeight,
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(nama,
                    style: blackTextFont.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                Text(golDarah,
                    style: blackTextFont.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(email,
                    style: blackTextFont.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                Text(umur,
                    style: blackTextFont.copyWith(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 70.0),
            //
            //Edit profile
            Row(
              children: <Widget>[
                SvgPicture.asset('assets/edit_profile.svg', height: 30),
                SizedBox(width: 10),
                Text('Edit Profile',
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 20.0),
            LineDash2(),
            SizedBox(height: 20.0),
            //riwayat donor
            Row(
              children: <Widget>[
                SvgPicture.asset('assets/stok.svg', height: 25),
                SizedBox(width: 10),
                Text('Riwayat Donor',
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 20.0),
            LineDash2(),
            SizedBox(height: 20.0),
            //tentang dbloods
            Row(
              children: <Widget>[
                SvgPicture.asset('assets/faq.svg', height: 30),
                SizedBox(width: 10),
                Text('Tentang Dbloods',
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 20.0),
            LineDash2(),
            SizedBox(height: 20.0),
            //Rate Dbloods App
            Row(
              children: <Widget>[
                SvgPicture.asset('assets/rate_dbloods.svg', height: 30),
                SizedBox(width: 10),
                Text('Rate Dbloods App',
                    style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 20.0),
            LineDash2(),
            SizedBox(height: 20.0),
            SignOutWidget(
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (context) => ShowDialogSignOut(
                    onPressed1: () {
                      Navigator.of(context).pop();
                    },
                    onPressed2: () {
                      Navigator.of(context).pop();
                      context.bloc<UserBloc>().add(SignOut());
                      AuthServices.signOut();
                      showFlushbarCustom(context,
                          icon: Icon(Icons.done_outline),
                          title: 'Anda telah sign out dari dbloods',
                          text: 'silahkan sign in kembali',
                          color: Colors.greenAccent);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            LineDash2(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
