class Profile {
  final String userName;
  final String phone;
  final String email;
  final int number;
  final String? website;
  final String? company;
  final String? companyTitle;
  final String? location;
  final String? tagline;
  final String? bio;

  const Profile(this.userName, this.phone, this.email, this.number,
      {this.website,
      this.company,
      this.companyTitle,
      this.location,
      this.tagline,
      this.bio});
}
