<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Jadwal extends Model
{
    use SoftDeletes;

    protected $fillable = ['hari_id', 'kelas_id', 'mapel_id', 'guru_id', 'jam_mulai', 'jam_selesai', 'ruang_id'];

    protected $table = 'jadwal';

    public function hari()
    {
        return $this->belongsTo(Hari::class);
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id');
    }

    public function mapel()
    {
        return $this->belongsTo(Mapel::class);
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class);
    }

    public function ruang()
    {
        return $this->belongsTo(Ruang::class);
    }

    public function nilaiRelasi()
    {
        return $this->hasMany(Nilai::class);
    }

    public function kkm($guru_id)
    {
        $mapel = Mapel::where('guru_id', $guru_id)->first();
        return $mapel ? $mapel->kkm : '-';
    }

    public function ulangan($mapel_id)
{
    $nilai = Nilai::where('mapel_id', $mapel_id)->first();
    return [
        'ulha_1' => $nilai->ulha_1 ?? '-',
        'ulha_2' => $nilai->ulha_2 ?? '-',
        'uts'    => $nilai->uts ?? '-',
        'ulha_3' => $nilai->ulha_3 ?? '-',
        'ulha_4' => $nilai->ulha_4 ?? '-',
        'uas'    => $nilai->uas ?? '-',
    ];
}

public function nilai($mapel_id)
{
    $nilai = Nilai::where('mapel_id', $mapel_id)->first();
    if (!$nilai) {
        return [
            'p_nilai' => '-',
            'p_predikat' => '-',
            'p_deskripsi' => 'Belum ada nilai',
            'k_nilai' => '-',
            'k_predikat' => '-',
            'k_deskripsi' => 'Belum ada nilai',
        ];
    }

    $p_nilai = ($nilai->ulha_1 + $nilai->ulha_2 + $nilai->uts + $nilai->ulha_3 + $nilai->ulha_4 + $nilai->uas) / 7;
    $k_nilai = ($nilai->keterampilan_1 + $nilai->keterampilan_2 + $nilai->keterampilan_3 + $nilai->keterampilan_4) / 4;

    return self::getNilaiDeskripsi($p_nilai, $k_nilai);
}



    private static function get_predikat_deskripsi($nilai, $jenis)
    {
        if ($nilai >= 88) {
            $predikat = 'A';
            $deskripsi = $jenis == 'pengetahuan' ? 'Pemahaman materi yang sangat baik' : 'Keterampilan yang sangat baik';
        } elseif ($nilai >= 79) {
            $predikat = 'B';
            $deskripsi = $jenis == 'pengetahuan' ? 'Pemahaman materi yang baik' : 'Keterampilan yang baik';
        } elseif ($nilai >= 70) {
            $predikat = 'C';
            $deskripsi = $jenis == 'pengetahuan' ? 'Pemahaman materi yang cukup baik' : 'Keterampilan yang cukup baik';
        } else {
            $predikat = 'D';
            $deskripsi = $jenis == 'pengetahuan' ? 'Pemahaman materi yang kurang baik dan perlu belajar lagi' : 'Keterampilan yang kurang baik dan perlu belajar lagi';
        }

        return [$predikat, $deskripsi];
    }

    public static function getNilaiDeskripsi($p_nilai, $k_nilai)
    {
        // Mendapatkan predikat dan deskripsi untuk pengetahuan
        list($p_predikat, $p_deskripsi) = self::get_predikat_deskripsi($p_nilai, 'pengetahuan');

        // Mendapatkan predikat dan deskripsi untuk keterampilan
        list($k_predikat, $k_deskripsi) = self::get_predikat_deskripsi($k_nilai, 'keterampilan');

        // Mengembalikan array dengan nilai, predikat, dan deskripsi
        return [
            'p_nilai' => $p_nilai, // nilai pengetahuan
            'p_predikat' => $p_predikat, // predikat pengetahuan
            'p_deskripsi' => $p_deskripsi, // deskripsi pengetahuan
            'k_nilai' => $k_nilai, // nilai keterampilan
            'k_predikat' => $k_predikat, // predikat keterampilan
            'k_deskripsi' => $k_deskripsi, // deskripsi keterampilan
        ];
    }



    public function getRapot($siswaId)
    {
        return Rapot::where('siswa_id', $siswaId)->where('mapel_id', $this->mapel_id)->first();
    }

    public function getPengajar()
    {
        return $this->guru;
    }

    public function getUlangan($siswaId)
    {
        return Ulangan::where('siswa_id', $siswaId)->where('mapel_id', $this->mapel_id)->first();
    }

    public function getNilai($siswaId)
    {
        return Rapot::where('siswa_id', $siswaId)->where('mapel_id', $this->mapel_id)->first();
    }

    public function getKkm()
    {
        return $this->guru->nilai->kkm;
    }
    
    /*public function getAbsen()
    {
        return Absen::where('tanggal', date('Y-m-d'))->where('guru_id', $this->guru_id)->first()->kehadiran->color;
    }*/

    public function getAbsen()
    {
        $absen = Absen::where('tanggal', date('Y-m-d'))
                      ->where('guru_id', $this->guru_id)
                      ->first();
                      
        return $absen ? $absen->kehadiran->color : 'Tidak Ada';
    }

    public function cekUlangan($siswaId)
    {
        return Ulangan::where('siswa_id', $siswaId)->where('mapel_id', $this->mapel_id)->first();
    }

    public function cekRapot($siswaId)
    {
        return Rapot::where('siswa_id', $siswaId)->where('mapel_id', $this->mapel_id)->first();
    }
}