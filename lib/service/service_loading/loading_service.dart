import 'package:SiPandu/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingService {
  Future<Map<String, String>> _getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  get() async {
    var headers = await _getHeaders();
    var response = await Dio().get(
        "${ApiUrl.baseUrl}/api/loadings?sort=id:desc",
        options: Options(headers: headers));

    Map obj = response.data;
    // print(obj);
    return obj["data"];
  }

  get_one(id) async {
    var headers = await _getHeaders();
    var response = await Dio().get("${ApiUrl.baseUrl}/api/loadings/$id",
        options: Options(headers: headers));

    Map obj = response.data;
    // print(obj);
    return obj["data"];
  }

  post(
      {required String lokasi,
      required String lokasi_detail,
      required String shift,
      String? grup,
      String? nama_supervisor,
      String? nama_pengawas,
      String? pengawas_rh,
      required String kondisi_1,
      required String kondisi_2,
      required String kondisi_3,
      required String kondisi_4,
      required String kondisi_5,
      required String kondisi_6,
      required String kondisi_7,
      required String kondisi_8,
      required String kondisi_9,
      required String kondisi_10,
      required String kondisi_11,
      required String kondisi_12,
      required String kondisi_13,
      required String kondisi_14,
      required String kondisi_15,
      required String kondisi_16,
      required String kondisi_17,
      required String kondisi_18,
      required String kondisi_19,
      required String kondisi_20,
      required String kondisi_21,
      required String kondisi_22,
      required String kondisi_23,
      required String kondisi_24,
      required String kondisi_25,
      required String kondisi_26,
      String? kode_1,
      String? kode_2,
      String? kode_3,
      String? kode_4,
      String? kode_5,
      String? kode_6,
      String? kode_7,
      String? kode_8,
      String? kode_9,
      String? kode_10,
      String? kode_11,
      String? kode_12,
      String? kode_13,
      String? kode_14,
      String? kode_15,
      String? kode_16,
      String? kode_17,
      String? kode_18,
      String? kode_19,
      String? kode_20,
      String? kode_21,
      String? kode_22,
      String? kode_23,
      String? kode_24,
      String? kode_25,
      String? kode_26,
      String? keterangan_1,
      String? keterangan_2,
      String? keterangan_3,
      String? keterangan_4,
      String? keterangan_5,
      String? keterangan_6,
      String? keterangan_7,
      String? keterangan_8,
      String? keterangan_9,
      String? keterangan_10,
      String? keterangan_11,
      String? keterangan_12,
      String? keterangan_13,
      String? keterangan_14,
      String? keterangan_15,
      String? keterangan_16,
      String? keterangan_17,
      String? keterangan_18,
      String? keterangan_19,
      String? keterangan_20,
      String? keterangan_21,
      String? keterangan_22,
      String? keterangan_23,
      String? keterangan_24,
      String? keterangan_25,
      String? keterangan_26,
      String? evident_1,
      String? evident_2,
      String? qr_1,
      String? qr_2,
      String? qr_3,
      int? created_by_loading,
      String? status}) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    var headers = await _getHeaders();
    var response = await Dio().post(
      "${ApiUrl.baseUrl}/api/loadings",
      options: Options(headers: headers),
      data: {
        "data": {
          "lokasi": lokasi,
          "nama_loading": lokasi_detail,
          "shift": shift,
          "grup": grup,
          "nama_supervisor": nama_supervisor,
          "nama_pengawas_mitra": nama_pengawas,
          "Pengawas_rh": pengawas_rh,
          "tanggal": formattedDate,
          "Kondisi_1": kondisi_1,
          "Kondisi_2": kondisi_2,
          "Kondisi_3": kondisi_3,
          "Kondisi_4": kondisi_4,
          "Kondisi_5": kondisi_5,
          "Kondisi_6": kondisi_6,
          "Kondisi_7": kondisi_7,
          "Kondisi_8": kondisi_8,
          "Kondisi_9": kondisi_9,
          "Kondisi_10": kondisi_10,
          "Kondisi_11": kondisi_11,
          "Kondisi_12": kondisi_12,
          "Kondisi_13": kondisi_13,
          "Kondisi_14": kondisi_14,
          "Kondisi_15": kondisi_15,
          "Kondisi_16": kondisi_16,
          "Kondisi_17": kondisi_17,
          "Kondisi_18": kondisi_18,
          "Kondisi_19": kondisi_19,
          "Kondisi_20": kondisi_20,
          "Kondisi_21": kondisi_21,
          "Kondisi_22": kondisi_22,
          "Kondisi_23": kondisi_23,
          "Kondisi_24": kondisi_24,
          "Kondisi_25": kondisi_25,
          "Kondisi_26": kondisi_26,
          "kode_1": kode_1,
          "kode_2": kode_2,
          "kode_3": kode_3,
          "kode_4": kode_4,
          "kode_5": kode_5,
          "kode_6": kode_6,
          "kode_7": kode_7,
          "kode_8": kode_8,
          "kode_9": kode_9,
          "kode_10": kode_10,
          "kode_11": kode_11,
          "kode_12": kode_12,
          "kode_13": kode_13,
          "kode_14": kode_14,
          "kode_15": kode_15,
          "kode_16": kode_16,
          "kode_17": kode_17,
          "kode_18": kode_18,
          "kode_19": kode_19,
          "kode_20": kode_20,
          "keterangan_1": keterangan_1,
          "keterangan_2": keterangan_2,
          "keterangan_3": keterangan_3,
          "keterangan_4": keterangan_4,
          "keterangan_5": keterangan_5,
          "keterangan_6": keterangan_6,
          "keterangan_7": keterangan_7,
          "keterangan_8": keterangan_8,
          "keterangan_9": keterangan_9,
          "keterangan_10": keterangan_10,
          "keterangan_11": keterangan_11,
          "keterangan_12": keterangan_12,
          "keterangan_13": keterangan_13,
          "keterangan_14": keterangan_14,
          "keterangan_15": keterangan_15,
          "keterangan_16": keterangan_16,
          "keterangan_17": keterangan_17,
          "keterangan_18": keterangan_18,
          "keterangan_19": keterangan_19,
          "keterangan_20": keterangan_20,
          "keterangan_21": keterangan_21,
          "keterangan_22": keterangan_22,
          "keterangan_23": keterangan_23,
          "keterangan_24": keterangan_24,
          "keterangan_25": keterangan_25,
          "keterangan_26": keterangan_26,
          "evident_1": evident_1,
          "evident_2": evident_2,
          "qr_1": qr_1,
          "qr_2": qr_2,
          "qr_3": qr_3,
          "id_user": created_by_loading,
          "status": status
        }
      },
    );
    Map obj = response.data;
    return obj;
  }

  put_pengawas(
      {required int id,
      String? pengawas_rh,
      String? qr_2,
      String? status}) async {
    var headers = await _getHeaders();
    var response = await Dio().put("${ApiUrl.baseUrl}/api/loadings/$id",
        options: Options(headers: headers),
        data: {
          "data": {"Pengawas_rh": pengawas_rh, "qr_2": qr_2, "status": status},
        });
    Map obj = response.data;
    return obj;
  }

  put_spv(
      {required int id,
      String? nama_supervisor,
      String? qr_3,
      String? status}) async {
    var headers = await _getHeaders();
    var response = await Dio().put("${ApiUrl.baseUrl}/api/loadings/$id",
        options: Options(headers: headers),
        data: {
          "data": {
            "nama_supervisor": nama_supervisor,
            "qr_3": qr_3,
            "status": status
          },
        });
    Map obj = response.data;
    return obj;
  }
}
