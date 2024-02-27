using TomoTemplates
using FileIO
using HDF5

TomoTemplates.fileio_save(File{format"TOMO.H5"}("test.tomo.h5"),Dict("hello"=>"world"),Dict("bye"=>rand(128,128,128)))
(meta, data) = TomoTemplates.fileio_load(File{format"TOMO.H5"}("test.tomo.h5"))

TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_deflate.tomo.h5"),meta,data,chunk=(128,128,128),filters=Filters.Deflate())

using H5Zzstd
using H5Zlz4
using H5Zbzip2
using H5Zbitshuffle

TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_zstd-lv3.tomo.h5"),meta,data,chunk=(128,128,128),filters=H5Zzstd.ZstdFilter(3))
TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_lz4.tomo.h5"),meta,data,chunk=(128,128,128),filters=H5Zlz4.Lz4Filter())
TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_bzip2.tomo.h5"),meta,data,chunk=(128,128,128),filters=H5Zbzip2.Bzip2Filter())
TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_bitshuffle_zstd-lv3.tomo.h5"),meta,data,chunk=(128,128,128),filters=H5Zbitshuffle.BitshuffleFilter(compressor = :zstd, comp_level=3))
TomoTemplates.fileio_save(File{format"TOMO.H5"}("test_bitshuffle_lz4.tomo.h5"),meta,data,chunk=(128,128,128),filters=H5Zbitshuffle.BitshuffleFilter(compressor = :lz4))

