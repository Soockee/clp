#!/bin/bash
mkdir archives
mkdir readable-archives

datasets=("android" "apache" "BGL" "Hadoop" "HDFS" "HealthApp" "HPC" "Linux" "Mac" "OpenSSH" "OpenStack" "Proxifier" "Spark" "Thunderbird" "Windows" "Zookeeper")
#17/06/09 20:10:42
#datasets=("android")

for i in ${!datasets[@]};
do
    dataset=${datasets[$i]}
    echo $(pwd)/archives/${dataset}  
    rm -rf $(pwd)/archives/${dataset}      
    logPath=/mnt/logs/${dataset}/${dataset}.log
    archivePath=$(pwd)/archives/${dataset}
    readableArchivePath=./readable-archives/${dataset}
    schemaPath=./schemas/${dataset}
    mkdir -p ${archivePath}/default
    mkdir -p ${archivePath}/custom
    mkdir -p ${archivePath}/vte
    mkdir -p ${readableArchivePath}/default
    mkdir -p ${readableArchivePath}/custom
    mkdir -p ${readableArchivePath}/vte
    default=$(./clp c --print-archive-stats-progress ${archivePath}/default $logPath)
    custom=$(./clp c --print-archive-stats-progress --schema-path ${schemaPath}/custom ${archivePath}/custom $logPath)
    vte=$(./clp c --print-archive-stats-progress --schema-path ${schemaPath}/vte ${archivePath}/vte $logPath)
    
    ./make-dictionaries-readable $(find ${archivePath}/default -type d -name "*-*-*-*-*") ${readableArchivePath}/default

    ./make-dictionaries-readable $(find ${archivePath}/custom -type d -name "*-*-*-*-*") ${readableArchivePath}/custom

    ./make-dictionaries-readable $(find ${archivePath}/vte -type d -name "*-*-*-*-*") ${readableArchivePath}/vte

    echo "${dataset} results:"
    echo "default: ${default}"
    echo "custom: ${custom}"
    echo "vte: ${vte}"
done

