## cnv_facets
p1 <- InputParam(id = "tbam", type = "File?", prefix = "-t", secondaryFiles = ".bai")
p2 <- InputParam(id = "nbam", type = "File?", prefix = "-n", secondaryFiles = ".bai")
p3 <- InputParam(id = "vcf", type = "File?", prefix = "-vcf", secondaryFiles = ".tbi")
p4 <- InputParam(id = "pileup", type = "File?", prefix = "-p")
p5 <- InputParam(id = "out", type = "string", prefix = "-o")
p6 <- InputParam(id = "build", type = "string?", prefix = "-g")
p7 <- InputParam(id = "targets", type = "File?", prefix = "-T")
p8 <- InputParam(id = "cval", type = "int[]?", prefix = "-cv")
o1 <- OutputParam(id = "Out", type = "File[]", glob = "$(inputs.out)*")
req1 <- list(class = "DockerRequirement",
             dockerPull = "hubentu/facets")
cnv_facets <- cwlProcess(baseCommand = "cnv_facets.R",
                       requirements = list(req1),
                       inputs = InputParamList(p1, p2, p3, p4, p5, p6, p7, p8),
                       outputs = OutputParamList(o1))
