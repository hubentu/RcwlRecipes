## https://github.com/walaj/svaba
p1 <- InputParam(id = "tbam", type = "File", prefix = "-t", secondaryFiles = list(".bai?", "^.bai?"))
p2 <- InputParam(id = "nbam", type = "File", prefix = "-n", secondaryFiles = list(".bai?", "^.bai?"))
p3 <- InputParam(id = "target", type = "File?", prefix = "-k")
p4 <- InputParam(id = "dbsnp", type = "File", prefix = "-D",
                 secondaryFiles = "$(self.nameext == '.gz' ? self.basename+'.tbi' : self.basename+'.idx')")
p5 <- InputParam(id = "ref", type = "File", prefix = "-G",
                 secondaryFiles = c(".amb", ".ann", ".bwt", ".pac", ".sa", ".fai"))
p6 <- InputParam(id = "cores", type = "int", prefix = "-p", default = 4L)
p7 <- InputParam(id = "prefix", type = "string", prefix = "-a")
o1 <- OutputParam(id = "raw", type = "File", glob = "*.bps.txt.gz")
o2 <- OutputParam(id = "contig", type = "File", glob = "*.contigs.bam")
o3 <- OutputParam(id = "discordants", type = "File", glob = "*.discordant.txt.gz")
o4 <- OutputParam(id = "log", type = "File", glob = "*.log")
o5 <- OutputParam(id = "align", type = "File", glob = "*.alignments.txt.gz")
o6 <- OutputParam(id = "uvcf", type = "File[]", glob = "*unfiltered.*")
o7 <- OutputParam(id = "svcf", type = "File[]", glob = "*svaba.somatic*")
o8 <- OutputParam(id = "gvcf", type = "File[]", glob = "*svaba.germline*")
req1 <- requireDocker("hubentu/svaba:1.2.0-bin")
req2 <- requireJS()
svaba_somatic <- cwlProcess(cwlVersion = "v1.2",
                            baseCommand = c("svaba", "run"),
                            requirements = list(req1, req2),
                            inputs = InputParamList(p1, p2, p3, p4, p5, p6, p7),
                            outputs = OutputParamList(o1, o2, o3, o4, o5, o6, o7, o8))
