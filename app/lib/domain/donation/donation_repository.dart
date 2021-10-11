import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/domain/donation/donation_provider.dart';
import 'package:app/util/convert_utf8.dart';
import 'package:get/get.dart';

class DonationRepository {
  final DonationProvider _donationProvider = DonationProvider();

  Future<Donation> save(DonationCreationDTO creationDTO) async {
    Response response = await _donationProvider.save(creationDTO.toJson());
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    Donation donation = Donation.fromJson(convertBody);
    return donation;
  }

/** Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);

    return cmRespDto.code ?? -1;
  }*/

  /*Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);

    if (cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    } else {
      return Post();
    }
  }

  Future<List<Donation>> findByTargetId(int targetId) async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body); // UTF-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    //print(cmRespDto.code);
    //print(cmRespDto.msg);
    //print(cmRespDto.data.runtimeType);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      //List<Post> hello = [];
      return <Post>[];
    }
  }*/
}
