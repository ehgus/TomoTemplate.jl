module Filters

using HDF5.Filters:
    Deflate,
    Shuffle,
    ExternalFilter

using H5Zzstd: ZstdFilter
using H5Zlz4: Lz4Filter
using H5Zbzip2: Bzip2Filter
using H5Zbitshuffle: BitshuffleFilter

end