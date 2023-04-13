class News {
  int? id;
  String? title;
  String? image;
  String? content;

  News({
    this.id,
    this.title,
    this.image,
    this.content,
  });
}

List<News> newsList = [
  News(
    id: 1,
    title:
        "PDIP Sebut Megawati Masih Olah dan Laku Batin Sebelum Umumkan Capres 2024",
    image:
        "https://awsimages.detik.net.id/visual/2022/06/21/megawati-di-rakernas-ii-pdi-perjuangan-desa-kuat-indonesia-maju-dan-berdaulat-21-juni-2022-15_169.png?w=650",
    content:
        "Ketua DPP Partai Demokrasi Indonesia Perjuangan (PDIP) Said Abdullah mengatakan Ketua Umum Megawati Soekarnoputri masih melakukan olah batin dan laku batin sebelum menjatuhkan pilihannya pada sosok calon presiden maupun calon wakil presiden yang akan diusung pada 2024. Dia menjelaskan, Megawati selalu mencermati dinamika politik dalam kesehariannya.",
  ),
  News(
    id: 2,
    title: "Wacana Penundaan Pemilu 2024 Ditolak Sejumlah Partai",
    image:
        "https://awsimages.detik.net.id/community/media/visual/2023/04/13/ke-pasar-minggu-jokowi-bagi-bagi-uang-dan-sembako-6_169.jpeg?w=700&q=90",
    content:
        "Wacana penundaan Pemilu 2024 kembali bergulir saat Menteri Investasi Bahlil Lahadalia tiba-tiba menyampaikan adanya usulan pengusaha untuk penundaan Pemilu 2024, pada 11 Januari 2022. Pada 23 Februari, giliran Ketua Umum Partai Kebangkitan Bangsa (PKB) Muhaimin Iskandar yang menyampaikan usulan yang sama setelah bertemu pengusaha karena alasan stagnasi ekonomi.",
  ),
  News(
    id: 3,
    title:
        "Kasus Sabu Ditukar Tawas, Teddy Minahasa Anggap Penjebakan Anita Cepu Sah Dilakukan",
    image: "https://cdn.antaranews.com/cache/800x533/2023/01/11/11.jpg",
    content:
        "Inspektur Jenderal Teddy Minahasa Putra berkukuh rencana operasi untuk menjebak Linda Pujiastuti alias Anita Cepu sah dilakukan. Operasi ini berujung pada kasus sabu ditukar tawas dengan Teddy berstatus sebagai terdakwa peredaran narkoba.",
  ),
  News(
    id: 4,
    title:
        "Mario Dandy Tahu Ayahnya Rafael Alun Ditetapkan sebagai Tersangka KPK",
    image:
        "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2023/03/Rafael-Alun-Trisambodo-Dery-Ridwansah-11.jpg",
    content:
        "Kuasa hukum Mario Dandy Satriyo, Basri mengatakan kliennya sudah tahu Rafael Alun Trisambodo, ayahnya ditetapkan sebagai tersangka gratifikasi oleh Komisi Pemberantasan Korupsi (KPK).",
  ),
  News(
    id: 5,
    title: "Piala Dunia U-20 Batal Salah Ganjar?",
    image: "https://cdn.antaranews.com/cache/800x533/2022/10/31/ganjar-2.jpg",
    content:
        "Gubernur Jawa Tengah Ganjar Pranowo menjadi sorotan menyusul pembatalan Piala Dunia U-20 Indonesia oleh FIFA pada 29 Maret 2023. Pasalnya, tak sedikit yang menganggap pernyataan Ganjar mengenai perlunya langkah terobosan Piala Dunia U-20 tanpa Israel menjadi alasan di balik keputusan FIFA kali ini.",
  ),
  News(
    id: 6,
    title:
        "Arteria Dahlan Ogah Salam Mahfud MD Usai Rapat Bahas Rp 349 T, Cuma Salam Sri Mulyani Terus Pergi",
    image:
        "https://awsimages.detik.net.id/community/media/visual/2019/09/12/2baf5a2d-03e0-47e4-a5b1-25213c37636d_169.jpeg?w=700&q=90",
    content:
        "Selesai rapat soal transaksi janggal Rp 349 triliun bersama Kemenkeu, Menko Polhukam dan PPATK, terlihat Arteria Dahlan hanya salami Sri Mulyani.",
  ),
  News(
    id: 7,
    title:
        "Dilaporkan ke Polisi karena Kritik Lampung, TikToker Awbimax Sempat Minta Perlindungan ke Australia",
    image:
        "https://akcdn.detik.net.id/visual/2023/04/13/viral-di-medsos-tiktoker-awbimax-kritik-lampung-berujung-dilaporkan-ke-polisi-ingin-ajukan-perlindungan-ke-australia_169.png?w=700&q=90",
    content:
        "Seorang content creator di TikTok bernama Awbimax jadi viral di media sosial. Baru-baru ini, ia mengunggah sebuah video yang berisikan kritikan terhadap daerah kelahirannya, yaitu Lampung. ",
  ),
  News(
    id: 8,
    title:
        "Siap Jadi Motor Koalisi Besar, PDIP Sebut Puan Maharani yang Lakukan Safari Politik Pertama Kali",
    image:
        "https://media.suara.com/pictures/653x366/2023/01/13/24903-puan-maharani-menangis-tangkapan-layarkompas-tv.jpg",
    content:
        "Ketua DPP Partai Demokrasi Indonesia Perjuangan atau PDIP Said Abdullah mengatakan Puan Maharani merupakan pelopor safari politik pertama kali. Dia menjelaskan, Puan sudah melakukan safari demi menjalin kerja sama politik alias koalisi jelang Pemilihan Umum atau Pemilu 2024.",
  ),
  News(
    id: 10,
    title: "Jokowi Resmi Teken Kepres Cuti Bersama Mulai 19 April",
    image:
        "https://cdn.antaranews.com/cache/730x487/2023/04/13/WhatsApp-Image-2023-04-13-at-15.06.25.jpeg",
    content:
        "Presiden Joko Widodo atau Jokowi  resmi menerbitkan aturan terbaru soal hari kerja dan jam kerja instansi pemerintah dan pegawai aparatur sipil negara. Beberapa aturan baru yaitu terkait jam kerja di bulan Ramadan dan penerapan secara fleksibel.",
  ),
];

List<News> hotNewsList = [
  News(
    id: 11,
    title:
        "Mario Dandy Tahu Ayahnya Rafael Alun Ditetapkan sebagai Tersangka KPK",
    image:
        "https://assets.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/jawapos/2023/03/Rafael-Alun-Trisambodo-Dery-Ridwansah-11.jpg",
    content:
        "Kuasa hukum Mario Dandy Satriyo, Basri mengatakan kliennya sudah tahu Rafael Alun Trisambodo, ayahnya ditetapkan sebagai tersangka gratifikasi oleh Komisi Pemberantasan Korupsi (KPK).",
  ),
  News(
    id: 12,
    title:
        "PDIP Sebut Megawati Masih Olah dan Laku Batin Sebelum Umumkan Capres 2024",
    image:
        "https://awsimages.detik.net.id/visual/2022/06/21/megawati-di-rakernas-ii-pdi-perjuangan-desa-kuat-indonesia-maju-dan-berdaulat-21-juni-2022-15_169.png?w=650",
    content:
        "Ketua DPP Partai Demokrasi Indonesia Perjuangan (PDIP) Said Abdullah mengatakan Ketua Umum Megawati Soekarnoputri masih melakukan olah batin dan laku batin sebelum menjatuhkan pilihannya pada sosok calon presiden maupun calon wakil presiden yang akan diusung pada 2024. Dia menjelaskan, Megawati selalu mencermati dinamika politik dalam kesehariannya.",
  ),
  News(
    id: 13,
    title:
        "Siap Jadi Motor Koalisi Besar, PDIP Sebut Puan Maharani yang Lakukan Safari Politik Pertama Kali",
    image:
        "https://media.suara.com/pictures/653x366/2023/01/13/24903-puan-maharani-menangis-tangkapan-layarkompas-tv.jpg",
    content:
        "Ketua DPP Partai Demokrasi Indonesia Perjuangan atau PDIP Said Abdullah mengatakan Puan Maharani merupakan pelopor safari politik pertama kali. Dia menjelaskan, Puan sudah melakukan safari demi menjalin kerja sama politik alias koalisi jelang Pemilihan Umum atau Pemilu 2024.",
  ),
];
