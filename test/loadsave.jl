using TomoTemplate
using FileIO

save("test.tomoh5",Dict("hello"=>"world"),Dict("bye"=>rand(128,128,128)))
(meta, data) = load("test.tomoh5")

# compresion capability
using TomoTemplate:Filters

save("test_deflate.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.Deflate())
save("test_zstd-lv3.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.ZstdFilter(3))
save("test_lz4.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.Lz4Filter())
save("test_bzip2.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.Bzip2Filter())
save("test_bitshuffle_zstd-lv3.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.BitshuffleFilter(compressor = :zstd, comp_level=3))
save("test_bitshuffle_lz4.tomoh5",meta,data,chunk=(128,128,128),filters=Filters.BitshuffleFilter(compressor = :lz4))
