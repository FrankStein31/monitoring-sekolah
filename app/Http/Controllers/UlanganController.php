<?php

namespace App\Http\Controllers;

use Auth;
use App\Guru;
use App\Siswa;
use App\Kelas;
use App\Jadwal;
use App\Nilai;
use App\Ulangan;
use App\Rapot;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Str;

class UlanganController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        $jadwal = Jadwal::where('guru_id', $guru->id)->orderBy('kelas_id')->get();
        $kelas = $jadwal->groupBy('kelas_id');
        return view('guru.ulangan.kelas', compact('kelas', 'guru'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $kelas = Kelas::orderBy('nama_kelas')->get();
        return view('admin.ulangan.home', compact('kelas'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

     public function store(Request $request)
    {
        \Log::info('Memulai proses penyimpanan nilai ulangan');

        try {
            $validatedData = $request->validate([
                'guru_id' => 'required|exists:guru,id',
                'kelas_id' => 'required|exists:kelas,id',
                'siswa_id' => 'required|exists:siswa,id',
                'ulha_1' => 'nullable|numeric|min:0|max:100',
                'ulha_2' => 'nullable|numeric|min:0|max:100',
                'uts' => 'nullable|numeric|min:0|max:100',
                'ulha_3' => 'nullable|numeric|min:0|max:100',
                'ulha_4' => 'nullable|numeric|min:0|max:100',
                'uas' => 'nullable|numeric|min:0|max:100',
            ]);

            \Log::info('Data request yang diterima:', $request->all());

            $guru = Guru::findOrFail($request->guru_id);
            \Log::info('Guru ditemukan:', $guru->toArray());

            $cekJadwal = Jadwal::where('guru_id', $guru->id)->where('kelas_id', $request->kelas_id)->count();
            \Log::info('Jumlah jadwal ditemukan:', ['count' => $cekJadwal]);

            if ($cekJadwal < 1) {
                return response()->json(['error' => 'Maaf guru ini tidak mengajar kelas ini!'], 400);
            }

            $ulangan = Ulangan::updateOrCreate(
                [
                    'siswa_id' => $request->siswa_id,
                    'kelas_id' => $request->kelas_id,
                    'guru_id' => $request->guru_id,
                    'mapel_id' => $guru->mapel_id,
                ],
                [
                    'ulha_1' => $request->ulha_1,
                    'ulha_2' => $request->ulha_2,
                    'uts' => $request->uts,
                    'ulha_3' => $request->ulha_3,
                    'ulha_4' => $request->ulha_4,
                    'uas' => $request->uas,
                ]
            );

            \Log::info('Ulangan berhasil dibuat atau diperbarui:', $ulangan->toArray());

            $nilai = ($request->ulha_1 + $request->ulha_2 + $request->uts + $request->ulha_3 + $request->ulha_4 + (2 * $request->uas)) / 7;
            $nilai = (int) $nilai;
            \Log::info('Nilai akhir dihitung:', ['nilai' => $nilai]);

            $predikat = $this->hitungPredikat($nilai);
            \Log::info('Predikat dihitung:', ['predikat' => $predikat]);

            $deskripsi = Nilai::where('guru_id', $request->guru_id)->first();
            \Log::info('Deskripsi predikat ditemukan:', $deskripsi ? $deskripsi->toArray() : 'Tidak ditemukan');

            if (!$deskripsi) {
                return response()->json(['error' => 'Tolong masukkan deskripsi predikat anda terlebih dahulu!'], 400);
            }

            $deskripsiField = 'deskripsi_' . strtolower($predikat);

            if (!isset($deskripsi->$deskripsiField)) {
                return response()->json(['error' => "Deskripsi untuk predikat {$predikat} tidak ditemukan!"], 400);
            }

            $rapot = Rapot::updateOrCreate(
                [
                    'siswa_id' => $request->siswa_id,
                    'kelas_id' => $request->kelas_id,
                    'guru_id' => $request->guru_id,
                    'mapel_id' => $guru->mapel_id,
                ],
                [
                    'p_nilai' => $nilai,
                    'p_predikat' => $predikat,
                    'p_deskripsi' => $deskripsi->$deskripsiField,
                ]
            );

            \Log::info('Rapot berhasil dibuat atau diperbarui:', $rapot->toArray());

            \Log::info('Proses penyimpanan nilai ulangan selesai');
            return response()->json(['success' => 'Nilai ulangan siswa berhasil ditambahkan!']);
        } catch (\Exception $e) {
            \Log::error('Error dalam menyimpan nilai ulangan: ' . $e->getMessage());
            \Log::error('Trace: ' . $e->getTraceAsString());
            return response()->json(['error' => 'Terjadi kesalahan saat menyimpan nilai. Silakan coba lagi.'], 500);
        }
    }

    // Method hitungPredikat yang perlu ditambahkan
    private function hitungPredikat($nilai)
    {
        if ($nilai >= 90) {
            return 'A';
        } elseif ($nilai >= 80) {
            return 'B';
        } elseif ($nilai >= 70) {
            return 'C';
        } elseif ($nilai >= 60) {
            return 'D';
        } else {
            return 'E';
        }
    }





    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $id = Crypt::decrypt($id);
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        $kelas = Kelas::findorfail($id);
        $siswa = Siswa::where('kelas_id', $id)->get();
        return view('guru.ulangan.nilai', compact('guru', 'kelas', 'siswa'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $id = Crypt::decrypt($id);
        $kelas = Kelas::findorfail($id);
        $siswa = Siswa::orderBy('nama_siswa')->where('kelas_id', $id)->get();
        return view('admin.ulangan.index', compact('kelas', 'siswa'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function ulangan($id)
    {
        $id = Crypt::decrypt($id);
        $siswa = Siswa::findorfail($id);
        $kelas = Kelas::findorfail($siswa->kelas_id);
        $jadwal = Jadwal::orderBy('mapel_id')->where('kelas_id', $kelas->id)->get();
        $mapel = $jadwal->groupBy('mapel_id');
        return view('admin.ulangan.show', compact('mapel', 'siswa', 'kelas'));
    }

    public function showUlangan()
    {
        $user = Auth::user();
        $kelas = $user->kelas;
        $mapel = // logika untuk mendapatkan mapel
        $jadwal = new Jadwal(); // atau cara lain untuk mendapatkan instance Jadwal
    
        return view('siswa.ulangan', compact('user', 'kelas', 'mapel', 'jadwal'));
    }

    public function siswa()
    {
        $siswa = Siswa::where('no_induk', Auth::user()->no_induk)->first();
        $kelas = Kelas::findorfail($siswa->kelas_id);
        $jadwal = Jadwal::where('kelas_id', $kelas->id)->orderBy('mapel_id')->get();
        $mapel = $jadwal->groupBy('mapel_id');
        return view('siswa.ulangan', compact('siswa', 'kelas', 'mapel'));
    }
}
