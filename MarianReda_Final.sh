#!/bin/bash

PS3="Select a number : "

until false; do 
 echo " Main Meun"	
 select main_op in "User" "Group" "Exit"; do
        case $main_op in
            "User")
		      until false; do 
		        echo "User_Menu"
		        ####User Menu ####
		        select sub_op_u in "ADD" "Delete" "Return"
		          do
		    	    case $sub_op_u in
				"ADD")
					read -p " Write the name user to add " name
					echo "$name added " 
					useradd $name 
					tail -3 /etc/passwd
					break 
					;;
				"Delete")
					read -p " Write the name user to delete " name
                                        echo  "$name deleted "
                                        userdel $name
                                        tail -3 /etc/passwd
					break
					;;
				"Return")
					break 3
					;;
				*)
					echo "#### Invalid option ####"
					break
				       	;;

		 	esac
		done
	done
	;;
	"Group")
		until false; do
                 echo "Group_Menu"
                 ####Group Menu ####
                 select sub_op_g in "ADD" "Delete" "Rename" "Return"
                   do
                        case $sub_op_g in
                                "ADD")
                                        read -p " Write the grop name to add " name
                                        echo " $name added "
                                        groupadd $name
                                        tail -3 /etc/group
					break
                                        ;;
                                "Delete")
                                        read -p " Write the group name to delete " name
                                        echo " $name deleted"
                                        groupdel $name
                                        tail -3 /etc/group
					break
                                        ;;
				"Rename")
					read -p " Write the old name of the group " old
					read -p " Write the nem name of the group " new
					groupmod -n $new $old
					echo "It changed from $old to $new and here from /etc/group "
					cat  /etc/group | grep $new 
					break
					;;
                                "Return")
                                        break 3
                                        ;;
				*)
				       	echo "#### Invalid option ####"
					break
				       	;;

                        esac
                done
	done
                ;;
            "Exit")
                echo "Exiting.."
	        exit 0	
                ;;
            *)
                echo "#### Invalid option ####"
		break
                ;;
        esac
    done
done
