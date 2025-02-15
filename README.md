# Interactive Conda Tools

## Overview
This repository provides an interactive **Conda Environment Manager** script (`conda_manager.sh`) that simplifies managing Conda environments. It allows users to list, create, remove, activate, and export Conda environments via an interactive menu.

## Features
- ✅ **List** all available Conda environments.
- ✅ **Create** a new Conda environment with a custom Python version.
- ✅ **Remove** a Conda environment with confirmation.
- ✅ **Activate** an existing Conda environment.
- ✅ **Export** a Conda environment to a YAML file for easy replication.

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/daveabiy/conda_control.git
   cd interactive-conda-tools
   ```
2. Make the script executable:
   ```bash
   chmod +x conda_manager.sh
   ```

## Usage
Run the interactive script with:
```bash
./conda_manager.sh
```
Follow the on-screen prompts to manage your Conda environments.

## Example Workflow
1. Run `./conda_manager.sh`
2. Select **"Create Environment"**
   - Enter the environment name (e.g., `myenv`)
   - Enter the desired Python version (default is **3.11**)
3. Select **"Activate Environment"** and choose `myenv`.
4. Select **"Export Environment"** to save its configuration.
5. Select **"Remove Environment"** if you no longer need it.

## Requirements
- **Conda** (Miniconda or Anaconda)
- **Bash** (for running the script)

## Contribution
Feel free to submit issues or pull requests to improve the script!

## License
This project is open-source under the **MIT License**.

