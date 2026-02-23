#!/bin/bash

# Submit the array job and capture its main Job ID
FIRST_JOB_ID=$(sbatch array_job.sub | cut -d' ' -f4)
echo "Submitted array job with ID: $FIRST_JOB_ID"

# Submit the dependent job
SECOND_JOB_ID=$(sbatch --dependency=afterany:$FIRST_JOB_ID after.sub| cut -d' ' -f4)
echo "Submitted dependent job $SECOND_JOB_ID to run after array job $FIRST_JOB_ID"
