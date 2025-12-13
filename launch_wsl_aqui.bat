@rem(){ :;};rem 2> /dev/null '
@goto hell
#';
exit
# Windows area 
:hell
START wsl -e bash -lic "cd %CD%; exec bash"
@echo 28-3
