import 'package:image_picker/image_picker.dart';


/*拍照*/
takePhoto() async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  print('拍照返回：' + image.toString());
}

/*相册*/
openGallery() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  print('相册返回：' + image.toString());
}

/*选取视频*/
getVideo() async {
  var image = await ImagePicker.pickVideo(source: ImageSource.gallery);
  print('选取视频：' + image.toString());
}
/*拍摄视频*/
takeVideo() async {
  var image = await ImagePicker.pickVideo(source: ImageSource.camera);
  print('拍摄视频：' + image.toString());
}
