# Nextflow wrapper for `spotyping` process.

## Pre-requisites 

- Conda
  - Nextflow
  - Spotyping

It is expected that you already have setup conda environment with the required packages.

```sh
conda create -c bioconda -n spotyping spotyping nextflow
```

Activate the environment

```sh
conda activate spotyping
```

## Usage

```
nextflow run https://github.com/nf-modules/spotyping
```

## Options

- `query` 

By default, the `spotyping` queries the databaset. To suppress this behavior, you can use the `query` parameter.

```
nextflow run https://github.com/nf-modules/spotyping --query false
```


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

## Cleanup space

**NOTE:** Once the analysis is completed and the expected results have been completed you can delete the `work` directory.

## Customizing the script

The sole purpose of process wrappers in `nf-modules` is to keep the code small, clean and hackable with some basic knowledge of `nextflow` scripting.

If you have specific requirements, you are encouraged to fork/clone and update your version to accomodate your needs. 


## Contribution

Contribution, in all forms, is most welcome!
