class SignIn {
  final String nameOfUserName;
  final String nameOfPassword;
  final String nameOfCaptcha;
  final String once;

  const SignIn(
      this.nameOfUserName, this.nameOfPassword, this.nameOfCaptcha, this.once);

  get captcha => "/_captcha?once=$once";
}
