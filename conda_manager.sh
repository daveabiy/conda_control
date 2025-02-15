#!/bin/bash

# Interactive Conda Environment Manager

echo "Conda Environment Manager"
PS3="Select an option: "
options=("List Environments" "Create Environment" "Remove Environment" "Activate Environment" "Export Environment" "Quit")

# Ensure conda is initialized
if ! command -v conda &> /dev/null; then
    echo "Conda is not initialized. Running 'conda init'..."
    conda init bash
    exec bash
fi

source ~/anaconda3/etc/profile.d/conda.sh 2>/dev/null || source ~/miniconda3/etc/profile.d/conda.sh 2>/dev/null

select opt in "${options[@]}"; do
    case $opt in
        "List Environments")
            conda env list
            ;;
        "Create Environment")
            read -p "Enter new environment name: " envname
            read -p "Enter Python version (default 3.11): " python_ver
            python_ver=${python_ver:-3.11}
            conda create -n "$envname" python="$python_ver" -c conda-forge -y
            echo "Environment $envname created using conda-forge."
            ;;
        "Remove Environment")
            select env in $(conda env list | awk '{print $1}' | grep -v "#" | grep -v "base"); do
                if [[ -n "$env" ]]; then
                    read -p "Are you sure you want to remove $env? (y/n): " confirm
                    if [[ "$confirm" == "y" ]]; then
                        conda remove --name "$env" --all -y
                        echo "Environment $env removed."
                    else
                        echo "Skipping removal."
                    fi
                else
                    echo "Invalid selection."
                fi
                break
            done
            ;;
        "Activate Environment")
            select env in $(conda env list | awk '{print $1}' | grep -v "#" | grep -v "base"); do
                if [[ -n "$env" ]]; then
                    echo "Activating $env..."
                    source activate "$env"
                else
                    echo "Invalid selection."
                fi
                break
            done
            ;;
        "Export Environment")
            select env in $(conda env list | awk '{print $1}' | grep -v "#" | grep -v "base"); do
                if [[ -n "$env" ]]; then
                    conda env export -n "$env" --channel conda-forge > "${env}_export.yml"
                    echo "Environment $env exported to ${env}_export.yml using conda-forge."
                else
                    echo "Invalid selection."
                fi
                break
            done
            ;;
        "Quit")
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done

