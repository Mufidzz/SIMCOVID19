import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class TimPakar extends StatefulWidget {
  @override
  _TimPakarState createState() => _TimPakarState();
}

class _TimPakarState extends State<TimPakar> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  BgAtas(
                    title: "Tim Pakar",
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: new Text(
                      "Ketua Tim Pakar: \n"
                          "\nProf. Drh. Wiku Adisasmito, M.Sc., Ph.D. (Sekretaris MWA UI dan Guru Besar FKM UI)"
                          "\n"
                          "\nDaftar Nama Pakar Medis:"
                          "\n"
                          "\n1.	Prof. Dr. dr. Akmal Taher, Sp.U(K) (Ketua Tim Uji Klinik Alat Kesehatan, Direktorat Jenderal Farmasi, Kementerian Kesehatan)"
                          "\n2.	Prof. Dr. dr. Zubairi Djoerban, Sp.PD-KHOM (Ketua Dewan Pertimbangan Ikatan Dokter Indonesia)"
                          "\n3.	Prof. Dr. dr. Menaldi Rasmin, Sp.P(K) (Ketua Dewan Pakar Ikatan Dokter Indonesia)"
                          "\n4.	Prof. Dr. Amin Soebandrio, Ph.D., Sp.MK (Kepala Eijkman Institute for Molecular Biology)"
                          "\n5.	Prof. dr. Herawati Sudoyo, M.S., Ph.D. (Deputi Eijkman Institute for Molecular Biology)"
                          "\n6.	Dr. dr. Agus Dwi Susanto, Sp.P(K) (Ketua Perhimpunan Dokter Paru)"
                          "\n7.	Dr. dr. Erlina Burhan, Sp.P(K) (Ketua POKJA Infeksi Perhimpunan Dokter Paru Indonesia)"
                          "\n8.	dr. Anis Karuniawati, Sp.MK(K), Ph.D. (Perhimpunan Ahli Mikrobiologi Klinik Indonesia)"
                          "\n9.	Dr. Tonny Loho, Sp.PK(K), (Perhimpunan Patologi Klinik)"
                          "\n10.	Prof. Dr. dr. Budi Sampurna, DFM., SH,Sp.F(K), Sp.KP (Ahli Hukum Kesehatan UI)"
                          "\n11.	Prof. Dr. dr. Ari Fahrial Syam, Sp.PD-KGEH, M.M.B. (Ahli Penyakit Dalam UI)"
                          "\n12.	Prof. Dr. dr. Bambang Supriyatno Sp.A (K) (Ahli Kesehatan Anak UI)"
                          "\n13.	dr. Aditya Susilo, Sp.PD, K-PTI, FINASIM (Ahli Infeksi Tropik UI)"
                          "\n14.	Dr. dr. Sally Aman Nasution, Sp.PD-KKV (Perhimpunan Dokter Spesialis Penyakit Dalam Indonesia)"
                          "\n15.	dr. Prasenohadi, Sp.P, Ph.D. (Ahli Penyakit Paru UI)"
                          "\n16.	Prof. Dr. dr. Syafri Kamsul Arif, Sp.An, KIC-KAKV (Ketua Perhimpunan Dokter Spesialis Anestesiologi dan Terapi Intensif Indonesia)"
                          "\n17.	dr. Bambang Pujo Semedi Sp.AN-KIC (Ketua Perhimpunan Intensive Care Indonesia)"
                          "\n18.	dr. Navy Gerard H. M. Lolong Wulung, Sp.An-KIV (Perhimpunan Dokter Intensive Care Indonesia)"
                          "\n19.	dr. Bambang Tutuko, Sp.An-KIC (Perhimpunan Dokter Intensive Care Indonesia)"
                          "\n20.	dr. Eddy Harijanto, Sp.An-KIC (Perhimpunan Dokter Intensive Care Indonesia)"
                          "\n21.	dr. Aldy Heriwardito, Sp.An-KAKV (Perhimpunan Dokter Spesialis Anestesiologi dan Terapi Intensif Indonesia)"
                          "\n22.	Prof. dr. Ova Emilia M.Med.Ed., Sp.OG(K), Ph.D. (Dekan FK KMK UGM)"
                          "\n"
                          "\nDaftar Nama Pakar Kesehatan Masyarakat:"
                          "\n"
                          "\n1.	Prof. dr. Meiwita P. Budiharsana, M.P.A., Ph.D. (Ahli Biostatistik FKM UI)"
                          "\n2.	Prof. dr. Asri C. Adisasmita, M.P.H., M.Phil., Ph.D. (Ahli Epidemiologi FKM UI)"
                          "\n3.	Prof. dr. Hasbullah Tabrany, M.P.H., Dr.PH (Ahli Kesehatan Masyarakat FKM UI)"
                          "\n4.	Prof. Amal Chalik Sjaaf, S.K.M., Dr.PH (Ahli Kesehatan Masyarakat FKM UI)"
                          "\n5.	Dr. dr. Sabarinah Prasetyo, M.Sc. (Ahli Biostatistik FKM UI)"
                          "\n6.	Dr. Ede Surya Darmawan, S.K.M., M.DM. (Ahli Kesehatan Masyarakat, Ketua Ikatan Ahli Kesehatan Masyarakat Indonesia)"
                          "\n7.	Drg. Masyitoh, M.A.R.S. (Ahli Manajemen Rumah Sakit UI)"
                          "\n8.	Dr. Dra. Dumilah Ayuningtyas, M.A.R.S. (Ahli Manajemen Rumah Sakit UI)"
                          "\n9.	Dewi Nur Aisyah, S.K.M., M.Sc., Ph.D. (Ahli Epidemiologi, Ikatan Ahli Kesehatan Masyarakat Indonesia)"
                          "\n10.	Dian Kusuma, S.K.M., M.P.H., Sc.D. (Ahli Kesehatan Global Imperial College London)"
                          "\n11.	Vilda Amir, S.K.M., M.Sc. (Ahli Kesehatan Masyarakat)"
                          "\n"
                          "\nDaftar Nama Pakar Modelling:"
                          "\n"
                          "\n1.	Prof. dr. Ascobat Gani, M.P.H., Dr.PH (Ekonomi Kesehatan, FKM UI)"
                          "\n2.	Prof. Budi Hidayat, S.K.M., MPPM., Ph.D (Ekonomi Kesehatan, FKM UI)"
                          "\n3.	Prof. dr. Asri C. Adisasmita, M.P.H., M.Phil., Ph.D. (Ahli Epidemiologi FKM UI)"
                          "\n4.	Prof. dr. Meiwita P. Budiharsana, M.P.A., Ph.D (Ahli Biostatistik FKM UI)"
                          "\n5.	Prof. Dr. dr. Akmal Taher, Sp.U(K) (Ketua Tim Uji Klinik Alat Kesehatan, Direktorat Jenderal Farmasi, Kementerian Kesehatan)"
                          "\n6.	Dr. Atik Nurwahyuni S.K.M., M.Kes. (Ekonomi Kesehatan, FKM UI)"
                          "\n7.	dr. Panji Fortuna Hadisoemarto M.P.H., Ph.D. (Peneliti dan Pengajar Kesehatan Masyarakat, FK UNPAD)"
                          "\n8.	dr. Iwan Ariawan, M.S.P.H. (Ahli Biostatistik, FKM UI)"
                          "\n9.	dr. Pandu Riono, M.P.H., Ph.D. (Ahli Biostatistik, FKM UI)"
                          "\n10.	Dr. dr. Tri Yunis Miko Wahyono, M.Sc. (Ahli Epidemiologi, FKM UI)"
                          "\n11.	Dr. Nurul Nadia Luntungan (Center for indonesia’s Strategic Development Initiatives (CISDI)"
                          "\n12.	Gumilang Aryo Sahadewo (Ekonomi, FEB UGM)"
                          "\n13.	Grace Dewi (Ekonomi, Kantor Staf Presiden)"
                          "\n14.	Pak Nata (Ekonomi, Kantor Staf Presiden)"
                          "\n15.	Drg. Monica Nirmala (Global Health, Harvard University)"
                          "\n16.	Prof. dr. Asri C. Adisasmita, M.P.H., M.Phil., Ph.D. (Ahli Epidemiologi FKM UI)"
                          "\n17.	drg. Masyitoh, M.A.R.S (Manajemen Rumah Sakit, FKM UI)"
                          "\n18.	Rizki Nauli Siregar, Ph.D. Candidate Departement of Economics, UC Davis (Pengajar FEB UI))"
                          "\n19.	Nasrudin Rus’an, S.E., MIDEC (Macroeconomic, Economic Modeling FEB UI)"
                          "\n20.	Muhammad Hanri (Ekonomi Pembangunan, LPEM FEB UI)"
                          "\n21.	M. H. Yudhistira, Ph.D. (LPEM FEB UI)"
                          "\n"
                          "\nDaftar Nama Pakar Teknologi Alat Kesehatan:"
                          "\n"
                          "\n1.	Prof. Brian Yuliarto S.T., M.Eng., Ph.D. (Ahli Teknologi Industri ITB)"
                          "\n2.	Prof. Ir. I Gede Wenten M.Sc., Ph.D. (Ahli Teknik Kimia dan Wakil Rektor ITB)"
                          "\n3.	Prof. Dr. dr. Hinky Hindra Irawan Satari, Sp.A(K) (Perhimpunan Pengendalian Infeksi Indonesia)"
                          "\n4.	Ir. Sanggono, Ph.D. (Ahli Teknik Kimia ITB)"
                          "\n5.	Prof. Dr. Ir. Muhammad Anis (Ahli Teknik Metalurgi, Rektor UI 2014-2019)"
                          "\n6.	Ir. Hendri Dwi Saptioratri Budiono, M.Eng. (Dekan FT UI-Ahli Teknik Mesin)"
                          "\n7.	Prof.Ir. Hermawan Kresno Dipojono M.S.E.E.,Ph.D. (Ahli Material Fungsional Maju, Teknik Fisika ITB, Ketua Senat Akademik ITB) Daftar Nama Pakar IT:"
                          "\n8.	Dr. Yudo Giri Sucahyo (Ahli E-Government, Data Mining dan Database System, Fakultas Ilmu Komputer, Universitas Indonesia)"
                          "\n9.	Dr. Edmon Makarim, S.Kom, S.H., LL.M (Pakar Hukum IT, Dekan FH UI)"
                          "\n"
                          "\nDaftar Nama Pakar Laboratorium Diagnostik:"
                          "\n"
                          "\n1.	Prof. Dr. drh. Fedik Abdul Rantam (Wakil Dekan FKH Unair dan Pakar Virologi dan Stemcell)"
                          "\n2.	Prof. Dr. drh. Wayan Tunas Artama (Koordinator OHCC dan Guru Besar Biokimia FKH UGM)"
                          "\n3.	Prof. dr. Maria Lucia Inge Lusida, M.Kes., Ph.D, Sp.MK (FK UNAIR ITD)"
                          "\n4.	Prof. dr. Muhammad Nasrun Massi, Ph.D. (Ahli Mikrobiologi dan Ilmu Biomedik, UNHAS)"
                          "\n5.	Dr. dr. Ni Nyoman Sri Budayanti, Sp.MK(K) (Ahli Mikrobiologi, FK UDAYANA)"
                          "\n6.	dr. Siswanto, MPH, DTM (Kepala Badan Litbangkes)"
                          "\n7.	Dr. dr. Vivi Setiawaty (Kepala Pustlitbang Biomedis dan Teknologi Dasar Kesehatan)"
                          "\n8.	dr. Anis Karuniawati, Sp.MK(K), Ph.D (Perhimpunan Ahli Mikrobiologi Klinik Indonesia)"
                          "\n9.	Dr. drh. Joko Pamungkas, M.Sc (Ahli Mikrobiologi Medis, FKH IPB)"
                          "\n10.	Prof. dr. Pratiwi Pudjilestari Sudarmono, Ph.D., SpMK(K) (Ahli Mikrobiologi FK UI)"
                          "\n11.	Prof. dr. Tri Wibawa, Ph.D, Sp.MK (Pakar Mikrobiologi Klinik, FK UGM)"
                          "\n12.	Prof. Dr. Amin Soebandrio, Ph.D., Sp.MK (Kepala Eijkman Institute for Molecular Biology)"
                          "\n"
                          "\nDaftar Nama Pakar bidang Hukum dan Sosial:"
                          "\n"
                          "\n1.	Prof. Dr. dr. Budi Sampurna, DFM., S.H.,Sp.F(K), Sp.KP (Ahli Hukum Kesehatan UI)"
                          "\n2.	Dr. Edmon Makarim, S.Kom., S.H., LL.M. (Ahli Hukum IT, Dekan FH UI)"
                          "\n3.	Prof. Hikmahanto Juwana, S.H., LL.M., Ph.D. (Ahli Hukum Internasional, FH UI)"
                          "\n4.	Prof. Dr. Ali Nina Liche Seniati, M.Si. (Ahli Psikologi UI)"
                          "\n5.	Dr. Tjut Rifameutia Umar Ali, M.A., Psikolog (Dekan Psikologi UI)"
                          "\n"
                          "\nDaftar Nama Staf Tim Pakar:"
                          "\n"
                          "\n1.	Dewi Nur Aisyah, S.K.M., M.Sc., Ph.D., DIC (Tim Pakar Kesehatan Masyarakat)"
                          "\n2.	Agus Setiawan, S.K.M., M.P.H. (Staf Pakar Kesehatan Masyarakat)"
                          "\n3.	Ida Ayu Kadek Ratih Prisma Laksmi, S.K.M. (Staf Pakar Kesehatan Masyarakat)"
                          "\n4.	dr. Budi Santoso M.Res. (Staf Pakar Medis)"
                          "\n5.	dr. Shela Rachmayanti (Staf Pakar Medis)"
                          "\n6.	Rahmi Nuraini, S.Gz. (Staf Pakar Kesehatan Masyarakat)"
                          "\n7.	Thifal Kiasatina, S.K.M. (Staf Pakar Kesehatan Masyarakat)"
                          "\n8.	Nurul Huda, S.Gz. (Staf Pakar Kesehatan Masyarakat)"
                          "\n9.	Haniena Diva, S.K.M. (Staf Pakar Epidemiologi)"
                          "\n10.	Niken Salindri, S.Gz. (Staf Pakar Kesehatan Masyarakat)"
                          "\n11.	Natasha Mayandra, S.Ds. (Staf Pakar Komunikasi Publik)"
                          "\n12.	Alexandra Suatan, S.Gz. (Staf Pakar Kesehatan Masyarakat)"
                          "\n13.	Rezi Nizma Nevisya, S.K.M. (Staf Pakar Kesehatan Masyarakat)"
                          "\n14.	Aghy Arya Papilaya, S.E. (Staf Pakar Kesehatan Masyarakat)"
                          "\n15.	Indira Rezki Wahyuni, S.K.M., M.Epid. (Staf Pakar Epidemiologi)"
                          "\n16.  dr. Yudi Reza Phallaphi (Staf Pakar Medis)",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[600]
                      ),
                    ),
                  ),
                ],
              )

          ),
        )
    );
  }
}