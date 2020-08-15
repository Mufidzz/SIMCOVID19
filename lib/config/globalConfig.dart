class CONFIG {
  static String API_URL_COVID = 'https://data.covid19.go.id/public/api';
  static String API_URL = 'https://simcovid.faftech.my.id';

  static String NEWS_URL = API_URL + "/news";
  static String IMG_URL = API_URL + '/img';
  static String NEWS_IMG_URL = IMG_URL + '/news/';

  static String COVID_NASIONAL_URL = API_URL_COVID + '/update.json';
  static String COVID_PROVINSI_URL = API_URL_COVID + "/prov.json";

  static String POST_IMAGE = API_URL+'/user/uploadimage/';
}