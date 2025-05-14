.PHONY: install update run reset menu

# Menü için bir hedef
menu:
	@echo "--------------------------------------------------"
	@echo "1. Install Packages & Modules"
	@echo "2. Update Repository"
	@echo "3. Run Program"
	@echo "4. Reset (Remove Executable)"
	@echo "5. Exit"
	@echo "--------------------------------------------------"
	@read -p "Please choose an option [1-5]: " option; \
	if [ $$option -eq 1 ]; then $(MAKE) install; \
	elif [ $$option -eq 2 ]; then $(MAKE) update; \
	elif [ $$option -eq 3 ]; then $(MAKE) run; \
	elif [ $$option -eq 4 ]; then $(MAKE) reset; \
	elif [ $$option -eq 5 ]; then echo "Exiting..."; exit 0; \
	else echo "Invalid option, please try again." && $(MAKE) menu; fi

install:
	@echo "Starting package and module installation..."
	@git pull
	@clear
	@echo "Installing necessary packages..."
	@apt-get install -y bash curl wget jq
	@apt-get install -y python python-pip nano
	@apt-get install -y clang ncurses-utils bc
	@python -m pip install -r data/requirements.txt
	@echo "Compiling source code..."
	@gcc main.c -o main
	@clear
	@echo -e "\n\033[37m[\033[33m*\033[37m] Packages & modules have been installed \033[31m..\n"
	@echo -e "\033[37m[\033[31m!\033[37m] To run the script, type \033[1;30m'./main'\033[0m\033[37m or \033[1;30mmake run\033[1;30m'\n"

update:
	@echo "Updating repository..."
	@git pull

run:
	@echo "Running the program..."
	@./main

reset:
	@echo "Removing the compiled executable..."
	@rm -f main
	@echo "Reset complete. You can rebuild with 'make install'."