#!/bin/bash

# Submit the array job and capture its main Job ID
FIRST_JOB_ID=$(sbatch --parsable array_job.sub)
echo "Submitted array job with ID: $FIRST_JOB_ID"

# Submit the dependent job
SECOND_JOB_ID=$(sbatch --dependency=afterok:$FIRST_JOB_ID anthology.sub)
echo "Submitted dependent job $SECOND_JOB_ID to run after array job $FIRST_JOB_ID"
