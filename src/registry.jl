detect_tomoh5(io) =  FileIO.detecthdf5(io) && endswith(io.name,".tomoh5>")
add_format(format"TOMO.H5",detect_tomoh5, [".tomoh5"], [:TomoTemplate => UUID("c4c57578-c03e-5b1b-b864-219221b2fcc7")])
