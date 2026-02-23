# HPC3 Quality of Life Improvements

This series of tutorials is designed for new or seasoned users of the 
High Performance Community Computing Cluster (HPC3) at UCI seeking to 
streamline their cluster workflow. For an excellent series of tutorials 
on how to get started using HPC3 and obtain account access, please see
<https://rcic.uci.edu/hpc3/hpc3.html>.

To get started with this tutorial, you will need:
* A basic understanding of shell scripting
* An HPC3 cluster account (see <https://rcic.uci.edu/account/getting-account.html> to obtain access)
* A terminal program of your choice (e.g. PuTTY, Terminal, Linux Subsystem for Windows)
* UCI VPN access or an on-campus Wi-Fi connection
* An installation of ssh. In bash, to check if ssh is in your PATH, type
    ```
    which ssh
    ```

To follow this tutorial, it will work best to clone the repository so that you have access to the example scripts. Then, follow along with the markdown files in each relevant section. Happy coding!

* [Array Jobs, Tips and Tricks](./array-jobs/array-jobs.md)
* [Queuing Jobs](./queuing/queuing.md)
* [Sending yourself email notifications](./email-notifications/email-tutorial.md)

There is already an excellent tutorial on generating SSH keys and using them to access the cluster [here](https://rcic.uci.edu/account/generate-ssh-keys.html). I recommend setting up an SSH key before starting this tutorial to reduce the friction of frequent authentication with DUO. 

Created by Davis Thuillier