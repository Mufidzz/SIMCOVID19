class CONFIG {
  static String API_URL = 'https://api.simcovid19.dev/';
  static String API_TOKEN = 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHByIjoxNjAyNDM1MzIzLCJpYXQiOjE2MDI0MTM3MjMsImlzcyI6ImRhNjZiYjliNTFkNjQ0NmQ4N2U5ZGM0YWZkMGYwYjQ2OGVlYmE0NWMifQ.LCk1CZFI0ExdOwQhqI5lcyD8j_ABeI8rsgfHA2CfSltDAvYigH-4D1ilowF-0QzlRZVnLK9FcND5gsYwvP9p2A';

  static String NEWS_URL = API_URL + "news";
  static String NEWS_LIMIT_URL = API_URL + "news/3/limit";


  static String CATEGORY_EDUCATION_URL = API_URL + "/category";
  static String EDUCATION_URL = API_URL + "/education";

  static String PROTOCOL_URL = API_URL + '/protokol/';

  static String HOAX_URL = API_URL + '/hoax/';

  static String QNA_URL = API_URL + '/qna/';

  static String POST_IMAGE = API_URL + '/user/uploadimage/';

  // COVID API
  static String API_URL_COVID = 'https://data.covid19.go.id/public/api';
  static String COVID_NASIONAL_URL = API_URL_COVID + '/update.json';
  static String COVID_PROVINSI_URL = API_URL_COVID + "/prov.json";
}
