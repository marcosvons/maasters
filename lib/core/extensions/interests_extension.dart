import 'package:auth/auth.dart';
import 'package:maasters/core/core.dart';

extension InterestExtension on SpecificInterest {
  String specificInterestAreaImage(
    SpecificInterest interest, {
    required bool isMobile,
  }) {
    if (!isMobile) {
      switch (interest.category) {
        case AreaOfInterest.cyberSecurity:
          return Images.cyberSecurityLogo;
        case AreaOfInterest.dataScience:
          return Images.dataScienceLogo;
        case AreaOfInterest.devOps:
          return Images.devopsLogo;
        case AreaOfInterest.digitalMarketing:
          return Images.digitalMarketingLogo;
        case AreaOfInterest.frontEnd:
          return Images.frontendLogo;
        case AreaOfInterest.graphicDesign:
          return Images.graphicDesignLogo;
        case AreaOfInterest.ioT:
          return Images.iotLogo;
        case AreaOfInterest.mobile:
          return Images.mobileLogo;
        case AreaOfInterest.productManagement:
          return Images.productManagementLogo;
        case AreaOfInterest.qa:
          return Images.qaLogo;
        case AreaOfInterest.uxUi:
          return Images.uxLogo;
        case AreaOfInterest.blockchain:
          return Images.blockchainLogo;
        case AreaOfInterest.backEnd:
          return Images.backendLogo;
        default:
          return '';
      }
    } else {
      switch (interest.category) {
        case AreaOfInterest.cyberSecurity:
          return Images.cyberSecurityLogoMobile;
        case AreaOfInterest.dataScience:
          return Images.dataScienceLogoMobile;
        case AreaOfInterest.devOps:
          return Images.devopsLogoMobile;
        case AreaOfInterest.digitalMarketing:
          return Images.digitalMarketingLogoMobile;
        case AreaOfInterest.frontEnd:
          return Images.frontendLogoMobile;
        case AreaOfInterest.graphicDesign:
          return Images.graphicDesignLogoMobile;
        case AreaOfInterest.ioT:
          return Images.iotLogoMobile;
        case AreaOfInterest.mobile:
          return Images.mobileLogoMobile;
        case AreaOfInterest.productManagement:
          return Images.productManagementLogoMobile;
        case AreaOfInterest.qa:
          return Images.qaLogoMobile;
        case AreaOfInterest.uxUi:
          return Images.uxLogoMobile;
        case AreaOfInterest.blockchain:
          return Images.blockchainLogoMobile;
        case AreaOfInterest.backEnd:
          return Images.backendLogoMobile;
        default:
          return '';
      }
    }
  }
}
