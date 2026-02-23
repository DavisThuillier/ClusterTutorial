# Array Jobs, Tips and Tricks

Consider the following (hopefully unfamiliar) scenario. 

You have a program called ``science.py`` which calls the function 
``physics()``. This function has internally declared parameters ``a``, 
``b``, and ``c``.  Each time you want to update the conditions of 
the problem, you open up your favorite text editor and modify the
hard-coded values of ``a``, ``b``, and ``c``. 

Every time you go to submit a job on the cluster, you first manually modify the value of the variables, then submit. One day, you decide that you need to run ``science.py`` for many different combinations of ``a``, ``b``, and ``c``. You think to yourself, "Wouldn't it be nice if I didn't need to modify ``science.py`` every time."

That's when you get an idea. Aha! I'll use command line arguments to pass the values I need to the function. You modify the function to be ``physics(a,b,c)`` and grab the arguments using a shiny, new ``argument_handling()`` function you've addedd to ``science.py``. Good for you.

However, when you go to submit your batch job, you realize that you have not gained anything, since the line in the job script which calls the program looks like 
```
science.py 42 -1 12
```
and you still need to modify those values every time. Bitter, you manually enter new values and submit jobs one after another for two hours.

However, you have actually gained something from your efforts modifying your program to accept command line arguments: the ability to use array jobs.

## Two simple examples
In [array_job_1.sub](./array_job_1.sub), we see a simple example of an array job which calls the program ``sum.sh``. Array jobs are distinguished from regular jobs by the use of the ``#SBATCH --array`` flag in the preamble. 
This will start a number of tasks specified by what follows the flag. 
For instance,
```
#SBATCH --array=1-5
```
will start 5 separate tasks, each of which runs the body of the rest of the job script. It also exposes the variable ``SLURM_ARRAY_TASK_ID``, which takes on the value of the corresponding task. This task ID may then be used to reference
* A labeled input file (e.g. "input_$SLURM_ARRAY_TASK_ID.txt")
* The line number of a file containing spaced command line arguments
    ```
    42 -1 12
    54 -3 15
    ```
* A "table of contents" file where each line specifies the path to the appropriate input file
    ```
    /path/to/first_input.txt
    /path/to/second_input/.txt
    ```

[array_job_1.sub](./array_job_1.sub) is an example of the second paradigm. 
```
INPUT=/inputs.txt
Args=$(awk "NR==$SLURM_ARRAY_TASK_ID" $INPUT)
```
In the first line, we specify a file, "inputs.txt" which contains the arguments we later want to pass to our function. The second line uses ``awk`` to grab the line corresponding to line number ``SLURM_ARRAY_TASK_ID`` from the file.

Once we have the arguments, we can pass the arguments to the program.
```
sum.sh $ARGS # Run program with given arguments
```

Before submitting the batch job, be sure to update the example to include
* your username 
* the correct number of lines of the input file (use ``wc -l``)

After submission, you should see a new ``logs`` directory which contains output and error files. Read these files to validate that ``sum.sh`` computed the sum of its inputs.

In [array_job_2.sub](./array_job_2.sub), we see an example of the second paradigm, where ``SLURM_ARRAY_TASK_ID`` is used to reference individual files for as input. Submit the job and read the output files in ``logs``.
