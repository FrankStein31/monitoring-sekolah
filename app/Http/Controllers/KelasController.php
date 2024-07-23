<?php

namespace App\Http\Controllers;

use App\Kelas;
use App\Guru;
use App\Jadwal;
use App\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class KelasController extends Controller
{
    public function index()
{
    // Mengambil data kelas dengan data guru yang terkait
    $kelas = Kelas::with('guru')->orderBy('nama_kelas', 'asc')->get();
    // Mengambil data guru (opsional, jika dibutuhkan di modal)
    $guru = Guru::orderBy('nama_guru', 'asc')->get();
    return view('admin.kelas.index', compact('kelas', 'guru'));
}


    public function create()
    {
        $guru = Guru::orderBy('nama_guru', 'asc')->get();
        return view('admin.kelas.create', compact('guru'));
    }

    public function store(Request $request)
{
    $request->validate([
        'nama_kelas' => 'required|string|max:255',
        'guru_id' => 'required|exists:guru,id',
    ]);

    Kelas::updateOrCreate(
        ['id' => $request->id],
        [
            'nama_kelas' => strtoupper($request->nama_kelas),
            'guru_id' => $request->guru_id,
        ]
    );

    return redirect()->route('kelas.index')->with('success', 'Data kelas berhasil disimpan');
}


    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        // 
    }

    public function update(Request $request, $id)
    {
        // 
    }

    public function destroy($id)
    {
        $kelas = Kelas::findOrFail($id);
        $countJadwal = Jadwal::where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::where('kelas_id', $kelas->id)->delete();
        }

        $countSiswa = Siswa::where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::where('kelas_id', $kelas->id)->delete();
        }

        $kelas->delete();
        return redirect()->back()->with('warning', 'Data kelas berhasil dihapus! (Silahkan cek trash data kelas)');
    }

    public function trash()
    {
        $kelas = Kelas::onlyTrashed()->get();
        return view('admin.kelas.trash', compact('kelas'));
    }

    public function restore($id)
    {
        $id = Crypt::decrypt($id);
        $kelas = Kelas::withTrashed()->findOrFail($id);

        $countJadwal = Jadwal::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::withTrashed()->where('kelas_id', $kelas->id)->restore();
        }

        $countSiswa = Siswa::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::withTrashed()->where('kelas_id', $kelas->id)->restore();
        }

        $kelas->restore();
        return redirect()->back()->with('info', 'Data kelas berhasil direstore! (Silahkan cek data kelas)');
    }

    public function kill($id)
    {
        $kelas = Kelas::withTrashed()->findOrFail($id);

        $countJadwal = Jadwal::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countJadwal >= 1) {
            Jadwal::withTrashed()->where('kelas_id', $kelas->id)->forceDelete();
        }

        $countSiswa = Siswa::withTrashed()->where('kelas_id', $kelas->id)->count();
        if ($countSiswa >= 1) {
            Siswa::withTrashed()->where('kelas_id', $kelas->id)->forceDelete();
        }

        $kelas->forceDelete();
        return redirect()->back()->with('success', 'Data kelas berhasil dihapus secara permanent');
    }

    public function getEdit(Request $request)
    {
        $kelas = Kelas::where('id', $request->id)->get();
        foreach ($kelas as $val) {
            $newForm[] = array(
                'id' => $val->id,
                'nama' => $val->nama_kelas,
                'guru_id' => $val->guru_id,
            );
        }
        return response()->json($newForm);
    }
}