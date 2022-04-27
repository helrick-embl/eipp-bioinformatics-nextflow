
nextflow.enable.dsl = 2

params.id = ""
params.fastqs = ""
params.sample = ""
params.transcriptome = ""

process cellranger {

	container "ghcr.io/helrick-embl/eipp-bioinformatics-nextflow/cellranger:1.0"
	//container "/home/training/Documents/eipp-bioinformatics-nextflow/cellranger_1.0.sif"
	memory "16 GB"

	input:
		val id
		path fastqs
		val sample
		path transcriptome	
	output:
		path "outs/*"
	
	script:
	"""
	cellranger count \
	--id=${id} --fastqs=${fastqs} --sample=${sample} \
	--transcriptome=${transcriptome}
	"""
}

workflow {
	cellranger(params.id, params.fastqs, params.sample, params.transcriptome)
}
