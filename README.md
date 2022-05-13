# Containerizable Machine Learning on Windows 10 & 11
*Using Python and CUDA, by Jeff Solas, 2022-04-26*
---
___
## Introduction
This guide is meant to serve both aspiring and seasoned data scientists who are hoping to create professional quality machine learning projects on their personal Windows machine. The goal is to provide a complete set of tools common to machine learning, to avoid the frustration of halting a project halfway through in order to set up new software.

Many of the suggested tools (VS Code, Anaconda) have alternatives (PyCharm, basic Python). Others (Docker) are a mainstay for enterprise applications, but could be overkill for an individual's projects.  The primary considerations for choosing tools were ubiquity, ease of use, and free, with an eye toward professional application and scalability.

Outside the scope of this guide are cloud-based platforms (AWS, GCP, Azure) and proprietary machine learning solutions (Plainsight, C3).
___
## VS Code and Git
### Description
* Visual Studio Code is a common and powerful code editor, featuring native integration with Git and a marketplace filled with useful extensions.
* Git is an open source version control system, and is perhaps best known as the engine behind [Github](https://github.com/).
### Purpose: Writing code and pushing to an online repository
Version control allows for easy tracking of modifications and progress over time, especially in a collaborative environment, and hosting code within a Github repository or alternative allows for easy transfer from one machine to another, as well as a simple way to back up code files.
### Instructions
1. Install VS Code | [Download Link](https://code.visualstudio.com/download)
    * Recommended: User Install
    * <details><summary>An incomplete list of useful VS Code Extensions<br>(click to expand)</summary>

        * Python
        * Github Markdown Preview
        * Github Pull Requests and Issues
        * PowerShell
        * Remote - WSL
        * Docker
        * Kubernetes
        * Remote - Containers
        </details>
2. Install Git | [Git for Windows](https://git-scm.com/download/win)
    * Recommended: Use VS Code for default editor
    * New to GitHub? | [Getting Started](https://docs.github.com/en/get-started)
        * Using the CLI | [Set Up Git](https://docs.github.com/en/get-started/quickstart/set-up-git)

___
## Anaconda, PowerShell, and Windows Terminal
### Description
* Anaconda provides a quick installation of a stable Python environment containing many of the standard data science libraries. Anaconda Navigator allows for easy virtual environment and software setup using a GUI, and `conda` commands provide a quick and powerful CLI for managing Python. Anaconda's Python isn't usually the most recent release, as the dependencies for many machine learning libraries lag behind by some time.
* PowerShell is a command-line shell which ships standard with Windows, but unfortunately that standard install is usually far behind the most up-to-date version.
* Windows Terminal is an excellent piece of software for managing different shells in Windows, with a tab-based, divisible interface.
### Purpose: Easy base environment without the PATH clutter
Anaconda now recommends against adding it to PATH.[^path] To accomodate this while enabling `conda` and `python` commands in the terminal for ease-of-use, the conda base environment can be activated automatically upon login via a PowerShell script. This can be done without relaxing the requirement for all PowerShell scripts to be signed.
[^path]: https://docs.anaconda.com/anaconda/user-guide/faq/#id2
### Instructions
1. Install latest Anaconda distribution | [Anaconda Website](https://www.anaconda.com/)
2. Install latest version of PowerShell | [PowerShell Github](https://github.com/PowerShell/PowerShell/)
    * For future updates, run the following command in PowerShell: | [Superuser Thread](https://superuser.com/questions/1287032/update-powershell-through-command-line)
      ```PowerShell
      > iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"
      ```
      * When updating this way, elect to "reboot later"; as the installer is running within PowerShell, PowerShell cannot be restarted.
3. Set up PowerShell with Windows Terminal
    * In Windows 10, Windows Terminal is not installed by default, and can be installed from the Microsoft Store if desired.
    * After PowerShell is installed, go into Windows settings and change the default terminal to Windows Terminal
        * *(Optionally, change the execution policy here to allow local PowerShell scripts to run without signing.)*
    * Within Windows Terminal, set the default profile to the up-to-date Powershell
4. Conda initialization and update: | [(Noteworthy StackOverflow)](https://stackoverflow.com/questions/56450606/how-to-add-anaconda-powershell-to-vscode)
    *  Initilize and update Anaconda from Anaconda Prompt
    * ```console
        > conda init
        > conda update conda
        ```  
5. Follow this guide to create a `$codeCertificate` | [ATA Article](https://adamtheautomator.com/how-to-sign-powershell-script/)
    * *(Can be skipped if changing the execution policy.)*
6. Write and sign `condify.ps1`, which:
    * Activates conda
    * Signs the newly revised `Conda.psm1` and `conda-hook.ps1`
        * *(Can be skipped if changing the execution policy.)*
    * <details>
        <summary>Show Code</summary>

        ```powershell
        $loc = 'C:\Users\Jeff\anaconda3'
        cmd /c "$loc\Scripts\activate.bat $loc"

        # The following can be omitted if execution policy allows
        $codeCertificate = Get-ChildItem Cert:\LocalMachine\My | Where-Object {$_.Subject -eq "CN=ATA Authenticode"}
        Set-AuthenticodeSignature -FilePath $loc\shell\condabin\Conda.psm1 -Certificate $codeCertificate -TimeStampServer http://timestamp.digicert.com
        Set-AuthenticodeSignature -FilePath $loc\shell\condabin\conda-hook.ps1 -Certificate $codeCertificate -TimeStampServer http://timestamp.digicert.com
        ```
        </details>
7. Create task in Windows Task manager which:
    * Triggers on startup or login
    * Opens PowerShell with admin rights (point to up-to-date `pwsh.exe`)
    * Runs `condify.ps1` (pass as `-File` argument)
___
## CUDA with Conda
### Description
* CUDA ("Compute Unified Device Architecture") allows for the creation of GPU-accelerated code and apps with compatible NVIDIA GPUs.
### Purpose: Faster training
GPU-accelerated learning can drastically speed up the training of many machine learning models. GPU-enabled libraries are not included within the conda base environment, and thus require their own setup.
### Instructions
1. Install the appropriate drivers for your NVIDIA Graphics card | [NVIDIA Drivers](https://www.nvidia.com/Download/index.aspx?lang=en-us)
    * Recommended (if applicable): NVIDIA GeForce Game Ready Driver
2. Ensure CUDA is Installed | [CUDA Windows Install Guide ](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)
    * For newer graphics cards and versions of certain drivers, such as NVIDIA GeForce Game Ready Driver, CUDA may come packaged with the driver.
    * CUDA installation can be verified with `nvcc -V` in a terminal
    ### CUDA-conda Verification:
3. Create conda environment, adding `keras-gpu`, `pandas`, and `notebook` | [Conda: Getting Started](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html)
    * `conda create -n cuda-test notebook keras-gpu pandas`
    * [Environment Management Docs](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
4. Verify that tensorflow can see your GPU | [Stack Overflow Reference](https://stackoverflow.com/questions/38559755/how-to-get-current-available-gpus-in-tensorflow)
    * Using the new conda enviroment in Python Interpreter or Jupyter Notebook:
        * Recommended: Utilise VS Code's built-in support for Notebooks.
    * ```python
      # Verify that the GPU is visible
      from tensorflow.python.client import device_lib
      [x.physical_device_desc or x.name for x in device_lib.list_local_devices()]
      ```
5. *(Optional)* Try training a simple model on the MNIST digit data set | [Tutorial](https://www.kaggle.com/code/hassanamin/tensorflow-mnist-gpu-tutorial/notebook)
___
## Docker, Using WSL with Ubuntu
### Description
* Docker is the flagship containerization service for scalable development. It uses OS-level virtualization to provide Platform-as-a-Service.
* WSL (Windows Subsystem for Linux) is an extremely lightweight VM enabling Linux shells to be launched and used from your desktop.
### Purpose: Universal Deployment from Virtualization
Docker enables developers to ensure their code can run anywhere, and greatly eases the construction and maintenance of microservices architecture and CI/CD pipelines. Although most useful for professional and enterprise-scale applications, amateur data scientists can still greatly benefit from learning the basics of Docker, enabling them to more easily collaborate with others regardless of hardware differences.

In the past, Docker ran on Windows using Hyper-V; now, however, WSL2 is the prefered VM backend for Windows[^prefer]. (Of note, WSL2 actually uses Hyper-V architecture to enable *its* virtualization)[^hyperv]

Ubuntu was chosen as the Linux distribution for this guide in order to minimize the burden on those with no or little Linux experience, as it is one of the most popular and user-friendly distros.
[^prefer]: https://docs.docker.com/desktop/windows/wsl/
[^hyperv]: https://docs.microsoft.com/en-us/windows/wsl/faq#does-wsl-2-use-hyper-v--will-it-be-available-on-windows-10-home-
### Instructions
1. WSL Installation | [Tutorial](https://docs.microsoft.com/en-us/learn/modules/get-started-with-windows-subsystem-for-linux/2-enable-and-install)
    * You may need to follow this for certain versions of Windows | [Update](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
    * Reboots are likely required throughout this process
    * Recommended: Install Ubuntu from the Microsoft store
        * Upon accessing the Ubuntu bash for the first time, update the distribution. (And continue to do so regularly)
            * ```console
              ~$ sudo apt update && sudo apt upgrade
              ```
2. Docker Installation | [Tutorial](https://docs.docker.com/desktop/windows/install/)
    * More rebooting likely required
    * In the Docker Settings, enable "Use Docker Compose V2" | [Docker Compose](https://docs.docker.com/compose/)
3. WSL Configuration | [Microsoft Documentation](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#global-configuration-options-with-wslconfig)
    * By default, WSL only has access to some of the host machine's resources - for example, only 50% of total memory on Windows, up to 8GB.
    * These defaults can be adjusted globally using a `.wslconfig` file, or for a specific linux distro using a `wsl.config` file
___
## Conda and CUDA in WSL
*(Optional)*
<!-- ### Description -->
### Purpose
Although these instances are becoming less common, there are times when compatibility issues result in certain desirable libraries or tools being available in Linux, but not Windows[^fast.ai]. Additionally, preparing WSL2 for data science grants additional flexibility choosing how to develop, and enables developing and testing linux-based instructions for and from `README` docs.
[^fast.ai]:https://docs.fast.ai/#Windows-Support
### Instructions
1. Ensure packages like git are up-to-date
    * ```console
      ~$ sudo apt update && sudo apt upgrade
      ```
    * You can also install or update a singular package, like git:
        * ```console
          ~$ sudo apt-get install git
          ```
2. Store Git username and email
    * ```console
      ~$ git config --global user.name "Your Name"
      ~$ git config --global user.email "your_email@domain.com"
      ~$ git config --global credential.helper store
      ```
3. Install Anaconda | [Download Page](https://www.anaconda.com/products/distribution#linux)
    * Copy the link address of the appropriate installer
        * At time of writing: `https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh`
    * Install via WSL CLI:
        * ```console
          ~$ WEBSITE="https://repo.anaconda.com/archive/"
          ~$ DOWNLOAD="Anaconda3-2021.11-Linux-x86_64.sh" # You will want to change this to the most recent / desired distribution
          ~$ wget "$WEBSITE$DOWNLOAD"
          ~$ sh ./$DOWNLOAD
          ~$ # After successful install, optional:
          ~$ # rm $DOWNLOAD
          ```
        * Recommendation: answer "Yes" when asked whether to run `conda init`
            * Recommendation: Once in conda base environment, remember to `conda update conda`
4. At this point tensorflow should be able to utilize the GPU, but the first time certain commands are ran, such as the import command, there will be 1-3 minutes of set-up required, per session.

5. [Perform the same verification process as done for Windows](#conda-verification)
    * Recommendation: Open a remote instance of VS Code
        * This requires the "WSL - Remote" Extension to be installed.
        * VS Code extensions are not cross-installed to the remote instance, and will need to be installed.
        * VS Code (Remote) will operate better when opening directories 

___

## Configuring GPU-Enabled Containers
 ```python
   # TODO: Walk through GPU-accelerated container creation
   ```
### Description
### Purposel
### Instructions
___
