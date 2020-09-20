part of '../widgets.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //editproflie
        InkWell(
          onTap: () {
            context.bloc<ScreenBloc>().add(GoToEditProfileScreen());
          },
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/edit_profile.svg', height: 30),
              SizedBox(width: 10),
              Text('Edit Profile',
                  style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Divider(color: greyColor),
        SizedBox(height: 20.0),
        //riwayat donor
        InkWell(
          onTap: () {
            context.bloc<ScreenBloc>().add(GoToRiwayatDonorScreen());
          },
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/stok.svg', height: 25),
              SizedBox(width: 10),
              Text('Riwayat Donor',
                  style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Divider(color: greyColor),
        SizedBox(height: 20.0),
        //tentang dbloods
        InkWell(
          onTap: () {
            context.bloc<ScreenBloc>().add(GoToAboutAppScreen());
          },
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/faq.svg', height: 30),
              SizedBox(width: 10),
              Text('Tentang Dbloods',
                  style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Divider(color: greyColor),
        SizedBox(height: 20.0),
        //Rate Dbloods App
        InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/rate_dbloods.svg', height: 30),
              SizedBox(width: 10),
              Text('Rate Dbloods App',
                  style: blackTextFont.copyWith(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Divider(color: greyColor),
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
                  AuthServices.signOut();
                  context.bloc<UserBloc>().add(SignOut());
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
        Divider(color: greyColor),
      ],
    );
  }
}
