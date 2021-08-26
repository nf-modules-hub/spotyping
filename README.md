# Nextflow wrapper for `spotyping` process.

## Pre-requisites 

- Conda
  - Nextflow
  - Spotyping


```sh
conda create -c bioconda -n spotyping spotyping nextflow
```


## Usage

```
nextflow run https://github.com/nf-modules/spotyping
```

## Options


- `filePattern`

By default, the process assumes the files to follow the `*_{R1,R2}.fastq.gz` pattern, which could be customized using this option

```
nextflow run https://github.com/nf-modules/spotyping --filePattern './*_{1,2}.fastq.gz'
```

- `resultsDir`

By default, it stores the result files locally inside the `results` directory.

```
nextflow run https://github.com/nf-modules/spotyping --resultsDir /path/to/custom/resultsDir
```

- `saveMode`

By default, the pipeline publishes the results in the `resultsDir` by copying the relevant output.

You can update this behavior by simply specifying the alternative such as `move` or `link` etc. 

```
nextflow run https://github.com/nf-modules/spotyping --saveMode move
```

For more information please refer [Nextflow documentation](https://www.nextflow.io/docs/latest/process.html#publishdir)

## Customizing the script

The sole purpose of process wrappers in `nf-modules` is to keep the code small, clean and hackable with some basic knowledge of `nextflow` scripting.

If you have specific requirements, you are encouraged to fork/clone and update your version to accomodate your needs. 


## Contribution

Contribution, in all forms, is most welcome!
