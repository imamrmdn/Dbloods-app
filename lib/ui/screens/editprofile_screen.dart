part of 'screens.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  EditProfileScreen(this.user);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namaController;
  String profilePath;
  bool isDataEdited = false;
  File profileImageFile;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.user.nama);
    profilePath = widget.user.profilePicture;
  }

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
            backgroundColor: whiteColor,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: blackColor),
                onPressed: () {
                  context
                      .bloc<ScreenBloc>()
                      .add(GoToMainScreen(bottomNavBarIndex: 3));
                },
              ),
              title: Text('Edit Profile', style: blackTextFont),
              elevation: 0,
              backgroundColor: whiteColor,
            ),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //profile
                    Container(
                      margin: EdgeInsets.only(top: 22, bottom: 10),
                      width: 120,
                      height: 140,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: mainColor, width: 1),
                              image: DecorationImage(
                                image: (profileImageFile != null)
                                    ? FileImage(profileImageFile)
                                    : (profilePath != '')
                                        ? NetworkImage(profilePath)
                                        : AssetImage('assets/user_profile.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  if (profilePath == "") {
                                    profileImageFile = await getImage();

                                    if (profileImageFile != null) {
                                      profilePath =
                                          basename(profileImageFile.path);
                                    }
                                  } else {
                                    profileImageFile = null;
                                    profilePath = "";
                                  }

                                  setState(() {
                                    isDataEdited =
                                        (namaController.text.trim() !=
                                                    widget.user.nama ||
                                                profilePath !=
                                                    widget.user.profilePicture)
                                            ? true
                                            : false;
                                  });
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage((profilePath == "")
                                          ? "assets/plus.png"
                                          : "assets/btn_min.png"),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    //userid
                    AbsorbPointer(
                      child: TextField(
                        controller: TextEditingController(text: widget.user.id),
                        style: whiteTextFont.copyWith(color: accentColor3),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "User ID",
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    //email
                    AbsorbPointer(
                      child: TextField(
                        controller:
                            TextEditingController(text: widget.user.email),
                        style: whiteTextFont.copyWith(color: accentColor3),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Email Address",
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    //nama
                    TextField(
                      controller: namaController,
                      onChanged: (text) {
                        setState(() {
                          isDataEdited = (text.trim() != widget.user.nama ||
                                  profilePath != widget.user.profilePicture)
                              ? true
                              : false;
                        });
                      },
                      style: blackTextFont,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Full Name",
                          hintText: "Full Name"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 250,
                      height: 45,
                      child: RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.alertCircle,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Change Password",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: (isUpdating)
                                      ? Color(0xFFBEBEBE)
                                      : Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              MdiIcons.alertCircle,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                        disabledColor: Color(0xFFE4E4E4),
                        color: Colors.red[400],
                        onPressed: (isUpdating)
                            ? null
                            : () async {
                                await AuthServices.resetPassword(
                                    widget.user.email);

                                Flushbar(
                                  duration: Duration(seconds: 2),
                                  icon: Icon(Icons.info_outline),
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.all(10),
                                  borderRadius: 8.0,
                                  titleText: Text('Silahkan Cek Email Anda.',
                                      style: whiteTextFont.copyWith(
                                          fontWeight: FontWeight.bold)),
                                  messageText: Text(
                                      'Tautan Link Ganti Password Anda telah dikirim melalui email.',
                                      style: whiteTextFont),
                                  backgroundColor: Colors.redAccent,
                                  flushbarPosition: FlushbarPosition.TOP,
                                )..show(context);
                              },
                      ),
                    ),
                    SizedBox(height: 20),
                    (isUpdating)
                        ? SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitFadingCircle(
                              color: Color(0xFF3E9D9D),
                            ),
                          )
                        : SizedBox(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  "Update My Profile",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      color: (isDataEdited)
                                          ? Colors.white
                                          : Color(0xFFBEBEBE)),
                                ),
                                disabledColor: Color(0xFFE4E4E4),
                                color: Color(0xFF3E9D9D),
                                onPressed: (isDataEdited)
                                    ? () async {
                                        setState(() {
                                          isUpdating = true;
                                        });

                                        if (profileImageFile != null) {
                                          profilePath = await uploadImage(
                                              profileImageFile);
                                        }

                                        context.bloc<UserBloc>().add(UpdateData(
                                            name: namaController.text,
                                            profileImage: profilePath));

                                        context.bloc<ScreenBloc>().add(
                                            GoToMainScreen(
                                                bottomNavBarIndex: 3));
                                      }
                                    : null),
                          )
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
