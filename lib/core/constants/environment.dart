import 'dart:io';

class Environments {
  //Cuando esta conectado el cable: 192.168.100.114
  //WIFI: 192.168.100.183
  //Authentication
  static String testHostLAN = "192.";
  static String testHostWIFI = "192.168.100.29";
  static String baseHost = "192.168.100.36";

  static String baseUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api"
          : "http://localhost:3000/api";

  static String authUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/auth"
          : "http://localhost:3000/api/auth";

  static String coursesUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/courses"
          : "http://localhost:3000/api/courses";

  static String courseContentsUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/courseContent"
          : "http://localhost:3000/api/courseContent";

  static String courseActivityUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/courseActivity"
          : "http://localhost:3000/api/courseActivity";

  static String courseStudentUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/courseStudent"
          : "http://localhost:3000/api/courseStudent";

  static String roleRequestsUrl =
      Platform.isAndroid
          ? "http://$baseHost:3000/api/roleRequests"
          : "http://localhost:3000/api/roleRequests";

  // Static methods to update each URL with a new host
  static void updateAuthUrl(String newHost) {
    authUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/auth"
            : "http://localhost:3000/api/auth";
  }

  static void updateCoursesUrl(String newHost) {
    coursesUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/courses"
            : "http://localhost:3000/api/courses";
  }

  static void updateCourseContentsUrl(String newHost) {
    courseContentsUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/courseContent"
            : "http://localhost:3000/api/courseContent";
  }

  static void updateCourseActivityUrl(String newHost) {
    courseActivityUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/courseActivity"
            : "http://localhost:3000/api/courseActivity";
  }

  static void updateCourseEnrollUrl(String newHost) {
    courseStudentUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/courseStudent"
            : "http://localhost:3000/api/courseStudent";
  }

  static void updateRoleRequestsUrl(String newHost) {
    roleRequestsUrl =
        Platform.isAndroid
            ? "http://$newHost:3000/api/roleRequests"
            : "http://localhost:3000/api/roleRequests";
  }

  static void updateAllUrls(String newHost) {
    updateAuthUrl(newHost);
    updateCoursesUrl(newHost);
    updateCourseContentsUrl(newHost);
    updateCourseActivityUrl(newHost);
    updateCourseEnrollUrl(newHost);
    updateRoleRequestsUrl(newHost);
    baseHost = newHost;
  }
}
