class CONFIG {
  // SELF API
  static String API_URL = 'https://simcovid.faftech.my.id';
  static String IMG_URL = API_URL + '/img';

  static String USER_URL = CONFIG.API_URL+'/user/';

  static String CATEGORY_EDUCATION_URL = API_URL + "/category";
  static String CATEGORY_EDUCATION_IMG_URL = IMG_URL + "/category";
  static String EDUCATION_URL = API_URL + "/education";
  static String EDUCATION_IMG_URL = IMG_URL + "/educations";

  static String NEWS_URL = API_URL+"/news/";
  static String NEWS_IMG_URL = IMG_URL + '/news/';

  static String PROTOCOL_URL = API_URL + '/protokol/';
  static String PROTOCOL_IMG_URL = IMG_URL + '/protokol/';

  static String HOAX_URL = API_URL + '/hoax/';

  // COVID API
  static String API_URL_COVID = 'https://data.covid19.go.id/public/api';
  static String COVID_NASIONAL_URL = API_URL_COVID + '/update.json';
  static String COVID_PROVINSI_URL = API_URL_COVID + "/prov.json";

  static String POST_IMAGE = API_URL+'/user/uploadimage/';
}