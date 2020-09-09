part of '../widgets.dart';

class EventCard extends StatelessWidget {
  final DateTime dateNow = DateTime.now();
  final String dateEvent = '13-09-2020';
  final EventDonor eventDonor;

  EventCard({this.eventDonor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        splashColor: mainColor,
        onTap: () {},
        child: Container(
          width: SizeTheme.sizeHorizontal,
          height: 120,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('assets/building.png', height: 30),
                  SizedBox(width: 15),
                  SizedBox(
                    width: SizeConfig.defaultWidth - 2 * 20 - 83,
                    child: SelectableText(
                      eventDonor.title,
                      style: blackTextFont,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  itemLeft(),
                  itemRight(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemLeft() {
    return Row(
      children: <Widget>[
        Image.asset('assets/date.png', height: 30),
        SizedBox(width: 15),
        Text(
            'Jadwal Event ${formatDate(DateTime.parse(eventDonor.tanggalEvent))}',
            style: blackTextFont)
      ],
    );
  }

  itemRight() {
    return InkWell(
      onTap: (formatDate(dateNow) !=
              formatDate(DateTime.parse(eventDonor.tanggalEvent)))
          ? () {
              print('belum bisa mengikuti event sesuai tanggal');
            }
          : () {
              print('berhasil mengikuti event');
            },
      child: Row(
        children: <Widget>[
          Text(
            'Ikuti Event',
            style: blackNumberFont.copyWith(color: mainColor),
          ),
          Icon(Icons.arrow_forward_ios, size: 18, color: mainColor)
        ],
      ),
    );
  }
}
