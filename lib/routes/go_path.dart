class GoPath{

  // static String parseData({String? url, String? title}) => '$url/:${title ?? ':title'}';

  static const String login = '/';

  static const String welcome = '/welcome';
  static const String customStepper = '/customStepper';

  static const String signup = '/signup';
  static const String forgotPassword = '/forgotPassword';
  static const String otp = '/otp';
  static const String createPassword = '/createPassword';
  static const String successPassword = '/passwordSuccess';
  static const String homePage = '/homepage';
  static const String profile = '/profile';
  static const String application = '/application';
  static const String editapplication = '/editapplication';
  static const String uploadPageFirstPart = '/UploadPageFirstPart';
  static const String uploadConfirmation = '/UploadConfirmation';
  static const String uploadMultiple = '/UploadMultiple';
  static const String lorDetails = '/LorDetails';
  static const String lorUpload = '/LorUpload';
  static const String lorConfirmation = '/LorConfirmation';
  static const String viewLorDetails = '/ViewLorDetails';
  static const String docName = '/docName';
  static const String uploadOther = '/UploadOther';
  static const String uploadOtherConfirmation = '/UploadOtherConfirmation';
  static const String searchCountry = '/searchCountry';
  static const String searchCourse = '/searchCourse';
  static const String explore = '/explore';
  static const String tabBarDocs = '/tabBarDocs';
  static const String unifinder = '/unifinder';
  static const String chat = '/chat';
  static const String congratulationScreen = '/CongratulationScreen';



  static String uploadOtherConfirmationWithData({String? title, String? title2}) => '/UploadOtherConfirmation/:${title ?? 'number'}/:${title2 ?? 'title2'}';
  static String uploadOtherWithData({String? name}) => '/UploadOther/:${name ?? 'number'}';
  static String viewLorDetailsTitle({String? title}) => '/ViewLorDetails/:${title ?? 'number'}';
  static String lorConfirmationWithData({String? title1, String? title2, String? index }) => '/LorConfirmation/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String lorUploadWithData({String? title1, String? title2, String? index }) => '/LorUpload/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String lorDetailsWithData({String? title1, String? title2, String? index }) => '/LorDetails/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String uploadPageFirstPartWithData({String? title1, String? title2, String? index }) => '/UploadPageFirstPart/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String uploadConfirmationWithData({String? title1, String? title2, String? index }) => '/UploadConfirmation/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String uploadMultipleWithData({String? title1, String? title2, String? index}) => '/UploadMultiple/:${index ?? 'index'}/:${title1 ?? 'title1'}/:${title2 ?? 'title2'}';
  static String sendOtp({String? number}) => '/otp/:${number ?? 'number'}';
  static String addApplication({String? title}) => '/application/:${title ?? 'title'}';
  static String editApplication({String? title, String? name, String? course}) => '/editapplication/:${title ?? 'title'}/:${name ?? 'name'}/:${course ?? 'course'}';



}