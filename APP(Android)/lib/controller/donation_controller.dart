import 'package:app/controller/dto/donation_creation_dto.dart';
import 'package:app/controller/dto/donation_delete_dto.dart';
import 'package:app/domain/donation/donation.dart';
import 'package:app/domain/donation/donation_repository.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  final DonationRepository _donationRepository = DonationRepository();
  final donations = <Donation>[].obs;

  Future<void> save(DonationCreationDTO dto) async {
    await _donationRepository.save(dto);
  }

  Future<List<Donation>> findByTargetId(int targetId) async {
    List<Donation> donations =
        await _donationRepository.findByTargetId(targetId);
    this.donations.value = donations;
    return donations;
  }

  Future<void> deleteDonation(int donationId, DonationDeleteDTO dto) async {
    await _donationRepository.deleteDonation(dto);
    await findByTargetId(dto.targetId);
    // if (true) {
    //   print("서버 쪽 삭제 성공");
    //   List<Donation> result =
    //       donations.where((donation) => donation.id != donationId).toList();
    //   donations.value = result;
    // }
  }
}
