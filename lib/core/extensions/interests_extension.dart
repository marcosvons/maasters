import 'package:auth/auth.dart';
import 'package:maasters/core/core.dart';

extension InterestExtension on SpecificInterest {
  String specificInterestAreaImage(SpecificInterest interest) {
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
  }
}
