## Convert Rcwl recipes into cwl descriptions

library(Rcwl)
library(RcwlPipelines)
pp <- list.files("Rcwl", "pl_", full.names = TRUE)
for(p in pp){
    pid <- sub(".R$", "", sub("^pl_", "", basename(p)))
    assign(pid, cwlLoad(p))
    dir.create(file.path("cwl", pid), recursive = TRUE, showWarnings = FALSE)
    writeCWL(get(pid), prefix = pid, outdir = file.path("cwl", pid), libPaths = FALSE)
}

tl <- list.files("Rcwl", "tl_", full.names = TRUE)
for(p in tl){
    pid <- sub(".R$", "", sub("^tl_", "", basename(p)))
    assign(pid, cwlLoad(p))
    writeCWL(get(pid), prefix = pid, outdir = "cwl")
}

meta <- RcwlPipelines:::cwlMeta(list.files("Rcwl", full.names = TRUE))
write.csv(meta, "cwlMeta.csv")
