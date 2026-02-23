# PREAMBLE THAT MUST BE PAIRED WITH job_report.sh TO SEND EMAIL

secs_to_human(){
    echo "$(( ${1} / 3600 )):$(( (${1} / 60) % 60 )):$(( ${1} % 60 ))"
}
start=$(date)

