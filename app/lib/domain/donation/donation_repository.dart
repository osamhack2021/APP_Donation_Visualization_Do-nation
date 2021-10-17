import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/controller/dto/donation_delete_dto.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/domain/donation/donation_provider.dart';
import 'package:app/util/convert_utf8.dart';
import 'package:http/http.dart' as http;

class DonationRepository {
  final DonationProvider _donationProvider = DonationProvider();

  Future<Donation> save(DonationCreationDTO creationDTO) async {
    http.Response response = await _donationProvider.save(creationDTO.toJson());
    dynamic convertBody = convertUtf8ToObject(response);
    Donation donation = Donation.fromJson(convertBody);
    return donation;
  }

  Future<List<Donation>> findByTargetId(int targetId) async {
    http.Response response = await _donationProvider.findByTargetId(targetId);
    List<dynamic> convertBody = convertUtf8ToObject(response);
    List<Donation> donations =
        convertBody.map((donation) => Donation.fromJson(donation)).toList();
    return donations;
  }

  Future<void> deleteDonation(DonationDeleteDTO deleteDTO) async {
    http.Response response =
        await _donationProvider.deleteDonation(deleteDTO.toJson());
  }

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
