# WILL ONLY WORK IF INCLUDED WITH MATCHING PREAMBLE FILE start_timer.sh
# ASSUMES AN ARRAY SLURM JOB IS BEING RUN

finish=$(date) # Get the time the job report is requested

array_ID=${SLURM_JOB_NAME}_${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID}
outfile=/pub/dthuilli/logs/${array_ID}.out
errfile=/pub/dthuilli/logs/${array_ID}.err

message_file=$(mktemp) # Create message in temporary file

echo "**Job Report**" >> $message_file
echo "Started: $start" >> $message_file
echo "Finished: $finish" >> $message_file
echo "Duration: $(secs_to_human $(($(date -d "$finish" +%s) - $(date -d "$start" +%s))))" >> $message_file
echo "Error Log" >> $message_file
echo "---------------------" >> $message_file
head $errfile >> $message_file
echo "....................." >> $message_file
echo "Output Log" >> $message_file
echo "---------------------" >> $message_file
head $outfile >> $message_file

cat $message_file | mail -s "SLURM $SLURM_JOB_NAME task $SLURM_ARRAY_TASK_ID has ended" dthuilli@uci.edu
rm $message_file # Clear temp file

