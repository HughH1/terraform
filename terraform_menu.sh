#!/bin/bash


echo "Please select an option by entering the number"
echo "0 - Quit"
echo "1 - Install terraform"
echo "2 - Initialise terraform"
echo "3 - Plan terraform"
echo "4 - Apply terraform"
echo "5 - Show status"
echo "6 - Destroy terraform"

read theInput
cd scripts/
while [ $theInput -ne 0 ]
do
case $theInput in 

    1)
        echo "Terraform is being installed"
        ./terraform_install.sh ;;    
    2)
        echo "Terraform is being initalised"
        ./terraform_initalise.sh ;;       
    3)
        echo "Terraform plan is being executed"
        ./terraform_plan.sh ;;
    4)
        echo "Terraform apply is being executed"
        ./terraform_apply.sh ;;
    5)
        echo "Terraform status:"
        ./terraform_show.sh ;;
    6)
        echo "Terraform is being destoryed"
        ./terraform_destroy.sh ;;
    *)
        echo "Please enter a valid option" ;;
    esac

        echo "Please select an option by entering the number"
        echo "0 - Quit"
        echo "1 - Install terraform"
        echo "2 - Initialise terraform"
        echo "3 - Plan terraform"
        echo "4 - Apply terraform"
        echo "5 - Show status"
        echo "6 - Destroy terraform"
        read theInput
done
