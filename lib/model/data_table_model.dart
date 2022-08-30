class User {
  final String firstname;
  final String lastname;
  final String Address;
  final String Phone;
  final String Birthday;
  final String Height;
  final String Birthplace;
  final String Nationality;
  final String CivilStatus;

  const User({
    required this.firstname,
    required this.lastname,
    required this.Address,
    required this.Phone,
    required this.Birthday,
    required this.Height,
    required this.Birthplace,
    required this.Nationality,
    required this.CivilStatus,
  });

  static List<User> getUsers() {
    return <User>[
      User(
        firstname: "Aal",
        lastname: 'kk',
        Address: 'asdsad',
        Phone: '12321321',
        Birthday: '12-20-2200',
        Height: '5ft4',
        Birthplace: 'qweqwe',
        Nationality: 'ASd',
        CivilStatus: 'Siongqwe',
      ),
      User(
        firstname: "bal",
        lastname: 'kk',
        Address: 'asdsad',
        Phone: '12321321',
        Birthday: '12-20-2200',
        Height: '5ft4',
        Birthplace: 'qweqwe',
        Nationality: 'ASd',
        CivilStatus: 'Siongqwe',
      ),
      User(
        firstname: "cal",
        lastname: 'kk',
        Address: 'asdsad',
        Phone: '12321321',
        Birthday: '12-20-2200',
        Height: '5ft4',
        Birthplace: 'qweqwe',
        Nationality: 'ASd',
        CivilStatus: 'Siongqwe',
      ),
      User(
        firstname: "dal",
        lastname: 'wqek',
        Address: 'wqeasdsad',
        Phone: '4412321321',
        Birthday: '22-20-2200',
        Height: 'asd5ft4',
        Birthplace: 'qweqwe',
        Nationality: 'ASd',
        CivilStatus: 'Siongqwe',
      ),
    ];
  }
}
