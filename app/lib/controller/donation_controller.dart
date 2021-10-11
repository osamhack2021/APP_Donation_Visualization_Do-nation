import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/domain/donation/donation_repository.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  final DonationRepository _donationRepository = DonationRepository();
  final donations = <Donation>[].obs;

  Future<void> save(DonationCreationDTO dto) async {
    await _donationRepository.save(dto);
  }

/*  Future<void> deleteById(int id) async {
    int result = await _postRepository.deleteById(id);
    if (result == 1) {
      print("서버 쪽 삭제 성공");
      List<Post> result = donations.where((post) => post.id != id).toList();
      //print(result.length);
      donations.value = result;
    }
  }
  Future<List<Post>> findAll() async {
    List<Post> posts = await _postRepository.findAll();
    this.donations.value = posts;
    return posts;
  }*/
}
