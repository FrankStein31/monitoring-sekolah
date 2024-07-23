@extends('template_backend.home')
@section('heading', 'Nilai Rapot')
@section('page')
  <li class="breadcrumb-item active">Nilai Rapot</li>
@endsection
@section('content')


<div class="col-md-12">
    <!-- general form elements -->
    <div class="card card-primary">
      <div class="card-header">
        <h3 class="card-title">Nilai Rapot Siswa</h3>
      </div>
      <!-- /.card-header -->
      <!-- form start -->
        @csrf
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
                <table class="table" style="margin-top: -10px;">
                    <tr>
                        <td>No Induk Siswa</td>
                        <td>:</td>
                        <td>{{ Auth::user()->no_induk }}</td>
                    </tr>
                    <tr>
                        <td>Nama Siswa</td>
                        <td>:</td>
                        <td class="text-capitalize">{{ Auth::user()->name }}</td>
                    </tr>
                    <tr>
                        <td>Nama Kelas</td>
                        <td>:</td>
                        <td>{{ $kelas->nama_kelas }}</td>
                    </tr>
                    <tr>
                        <td>Wali Kelas</td>
                        <td>:</td>
                        <td>{{ $kelas->guru->nama_guru }}</td>
                    </tr>
                    @php
                        $bulan = date('m');
                        $tahun = date('Y');
                    @endphp
                    <tr>
                        <td>Semester</td>
                        <td>:</td>
                        <td>
                            @if ($bulan > 6)
                                {{ 'Semester Ganjil' }}
                            @else
                                {{ 'Semester Genap' }}
                            @endif
                        </td>
                    </tr>
                    <tr>
                        <td>Tahun Pelajaran</td>
                        <td>:</td>
                        <td>
                            @if ($bulan > 6)
                                {{ $tahun }}/{{ $tahun+1 }}
                            @else
                                {{ $tahun-1 }}/{{ $tahun }}
                            @endif
                        </td>
                    </tr>
                </table>
                <hr>
            </div>
            <div class="col-md-12">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="ctr">No.</th>
                            <th>Mata Pelajaran</th>
                            <th class="ctr">ULHA 1</th>
                            <th class="ctr">ULHA 2</th>
                            <th class="ctr">UTS</th>
                            <th class="ctr">ULHA 3</th>
                            <th class="ctr">ULHA 4</th>
                            <th class="ctr">UAS</th>
                            <th class="ctr">Nilai Pengetahuan</th>
                            <th class="ctr">Predikat Pengetahuan</th>
                            <th class="ctr">Deskripsi Pengetahuan</th>
                            <th class="ctr">Nilai Keterampilan</th>
                            <th class="ctr">Predikat Keterampilan</th>
                            <th class="ctr">Deskripsi Keterampilan</th>
                        </tr>
                    </thead>
                    <tbody>


                    @foreach ($mapel as $val => $data)
    <tr>
        <?php $data = $data[0]; ?>
        <td>{{ $loop->iteration }}</td>
        <td>{{ $data->mapel->nama_mapel }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['ulha_1'] ?? '-' }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['ulha_2'] ?? '-' }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['uts'] ?? '-' }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['ulha_3'] ?? '-' }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['ulha_4'] ?? '-' }}</td>
        <td class="ctr">{{ $data->ulangan($data->mapel->id)['uas'] ?? '-' }}</td>
        @php
            $pengetahuan_nilai = $data->ulangan($data->mapel->id)['pengetahuan_nilai'] ?? 0;
            $keterampilan_nilai = $data->ulangan($data->mapel->id)['keterampilan_nilai'] ?? 0;
            $nilai = App\Jadwal::getNilaiDeskripsi($pengetahuan_nilai, $keterampilan_nilai);
        @endphp
        <td class="ctr">{{ $nilai['p_nilai'] }}</td>
        <td class="ctr">{{ $nilai['p_predikat'] }}</td>
        <td class="ctr">{{ $nilai['p_deskripsi'] }}</td>
        <td class="ctr">{{ $nilai['k_nilai'] }}</td>
        <td class="ctr">{{ $nilai['k_predikat'] }}</td>
        <td class="ctr">{{ $nilai['k_deskripsi'] }}</td>
    </tr>
@endforeach





                    </tbody>
                </table>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
@endsection
@section('script')
    <script>
        $("#UlanganSiswa").addClass("active");
    </script>
@endsection