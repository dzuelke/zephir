# =================================================
# Functions
# =================================================

# Regular Colors
NC        =\033[0m
Black     =\033[0;30m
Red       =\033[0;31m
Green     =\033[0;32m
Yellow    =\033[0;33m
Blue      =\033[0;34m
Purple    =\033[0;35m
Cyan      =\033[0;36m
White     =\033[0;37m
Gray      =\033[0;90m

# Background Colors
On_Black  =\033[40m
On_Red    =\033[41m
On_Green  =\033[42m
On_Yellow =\033[43m
On_Blue   =\033[44m
On_Purple =\033[45m
On_Cyan   =\033[46m
On_White  =\033[47m

# Messages
SUCCESS = $(Black)$(On_Green) SUCCESS $(NC)
FAILURE = $(White)$(On_Red) FAILURE $(NC)

# =================================================
# Functions
# =================================================
define install_phar
	@if test ! -f "$(VENDOR_DIR)/$(1:.phar=)"; then \
		FILE_NAME=$(1:.phar=); \
		echo "$(Green)Downloading $(1)...$(NC)"; \
		curl -sSL $(2) -o $(VENDOR_DIR)/$$FILE_NAME; \
		chmod +x "$(VENDOR_DIR)/$$FILE_NAME"; \
	fi

	$(VENDOR_DIR)/$(1:.phar=) --version
endef

# =================================================
# Logo and Main Entry Point
# =================================================

.title:
	echo ' _____              __    _       '
	echo '/__  /  ___  ____  / /_  (_)____  '
	echo '  / /  / _ \/ __ \/ __ \/ / ___/  '
	echo ' / /__/  __/ /_/ / / / / / /      '
	echo '/____/\___/ .___/_/ /_/_/_/       '
	echo '         /_/                      '
	echo ''
	./zephir --version

---: ## ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
help: .title ## Show this help and exit
	echo ''
	echo "$(Yellow)Usage:$(NC)\n"
	echo "  command [$(Cyan)arguments$(NC)]"
	echo ''
	echo "  to run single Test use: $(Cyan)make <test-command>$(NC) $(Green)testName$(NC)"
	echo ''
	echo "$(Yellow)Available commands:$(NC)"
	echo ''
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_PATH) | \
		awk 'BEGIN {FS = ":.*?## "}; \
		{printf "  $(Green)%-15s$(NC) %s\n", $$1, $$2}'
	echo ''
%:
	:
