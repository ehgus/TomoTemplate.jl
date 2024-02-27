using TomoTemplates
using FileIO

save("test.tomoh5",Dict("hello"=>"world"),Dict("bye"=>rand(128,128,128)))
(meta, data) = load("test.tomoh5")

# compresion capability
using HDF5:Filters
using H5Zzstd
using H5Zlz4
using H5Zbzip2
using H5Zbitshuffle

save("test_deflate.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.Deflate())
save("test_zstd-lv3.tomoh5",meta,data,chunk=(128,128,128),filters=H5Zzstd.ZstdFilter(3))
save("test_lz4.tomoh5",meta,data,chunk=(128,128,128),filters=H5Zlz4.Lz4Filter())
save("test_bzip2.tomoh5",meta,data,chunk=(128,128,128),filters=H5Zbzip2.Bzip2Filter())
save("test_bitshuffle_zstd-lv3.tomoh5",meta,data,chunk=(128,128,128),filters=H5Zbitshuffle.BitshuffleFilter(compressor = :zstd, comp_level=3))
save("test_bitshuffle_lz4.tomoh5",meta,data,chunk=(128,128,128),filters=H5Zbitshuffle.BitshuffleFilter(compressor = :lz4))

