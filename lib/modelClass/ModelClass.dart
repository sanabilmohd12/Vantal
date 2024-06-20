class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}

class Brand {
  String id;
  String BrandName;
  String Logo;

Brand(this.id,this.BrandName,this.Logo);
}
class Vehicle{

  String vId;
  String vName;
  String type;
  String company;
  String engineSize;
  String transmission;
  String seat;
  String fType;
  String mileage;
  String location;
  String price;
  String modelYear;
  String deposit;
  String brandLogo;
  List<String> vImages;

  Vehicle(this.vId,this.vName,this.type,this.company,this.engineSize,this.transmission,this.seat,this.fType,this.mileage,this.location,this.price,this.modelYear,this.deposit,this.brandLogo,this.vImages,);
}

class Profile{
  String pId;
  String name;
  String email;
  String phone;
  String dob;
  String profileImage;
  String idProof;
  Profile(this.pId,this.name,this.email,this.phone,this.dob,this.profileImage,this.idProof);
}

class Booking{
  String bId;
  String userId;
  String vehicleId;
  String vName;
  String vCompany;
  String pickUpDate;
  String returnDate;
  String bookingDate;
  Booking(this.bId,this.userId,this.vehicleId,this.vName,this.vCompany,this.pickUpDate,this.returnDate,this.bookingDate);

}
class BookingStatus{
  String bId;
  String userId;
  String vehicleId;
  String vName;
  String vCompany;
  String pickUpDate;
  String returnDate;
  String bookingDate;
  String status;
  BookingStatus(this.bId,this.userId,this.vehicleId,this.vName,this.vCompany,this.pickUpDate,this.returnDate,this.bookingDate,this.status);

}
class BookingDetails{
  String userId;
  String vehicleId;
  String vName;
  String vBrand;
  String vImage;
  String userImage;
  String userName;
  String userDob;
  String userEmail;
  String userPhone;
  String rentalDays;
  String bookingDate;
  String pickUpDate;
  String returnDate;
  String pickUpLocation;
  String idProof;
  BookingDetails(this.userId,this.vehicleId,this.vName,this.vBrand,this.vImage,this.userImage,this.userName,this.userDob,this.userEmail,this.userPhone,this.rentalDays,this.bookingDate,this.pickUpDate,this.returnDate,this.pickUpLocation,this.idProof);
}
class UserDetails{
  String userId;
  String name;
  String email;
  String phone;
  String dob;
  String profileImage;
  String idProof;
  UserDetails(this.userId,this.name,this.email,this.phone,this.dob,this.profileImage,this.idProof);
}