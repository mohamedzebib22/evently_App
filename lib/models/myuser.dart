class MyUser {
  static String collectionName = 'Users';
  String id;
  String name;
  String email;

  MyUser({required this.id , required this.name ,required this.email});

  //Object To Json:
  //===============
  Map<String , dynamic> addDataToFireStore(){
    return {
      'id' : id,
      'name' : name,
      'email': email,
    };
  }
  //Json To Object:
  //===============
  MyUser.getDatafromUserFromFireStore(Map<String, dynamic>? getData):this(
     id: getData!['id'],
     name: getData['name'],
     email: getData['email']
     );
}