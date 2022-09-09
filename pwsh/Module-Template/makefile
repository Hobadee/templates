ODIR=build/module
ONAME=module

ifeq ($(OS),Windows_NT)
	# Generic Windows settings
	CMD_PWSH=C:\Windows\SysNative\WindowsPowerShell\v1.0\powershell.exe
	CMD_DEL=del
	
	# Architecture-specific settings
    # CCFLAGS += -D WIN32
    ifeq ($(PROCESSOR_ARCHITEW6432),AMD64)
        # CCFLAGS += -D AMD64
    else
        ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
            # CCFLAGS += -D AMD64
        endif
        ifeq ($(PROCESSOR_ARCHITECTURE),x86)
            # CCFLAGS += -D IA32
        endif
    endif
else
	# Generic *NIX settings
	CMD_PWSH=pwsh
	CMD_DEL=rm
	
	# Architecture-specific settings
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        # CCFLAGS += -D LINUX
    endif
    ifeq ($(UNAME_S),Darwin)
        # CCFLAGS += -D OSX
    endif
    UNAME_P := $(shell uname -p)
    ifeq ($(UNAME_P),x86_64)
        # CCFLAGS += -D AMD64
    endif
    ifneq ($(filter %86,$(UNAME_P)),)
        # CCFLAGS += -D IA32
    endif
    ifneq ($(filter arm%,$(UNAME_P)),)
        # CCFLAGS += -D ARM
    endif
endif


all: build-module

shell: build-module doShell

test: build-module doTest

test-function: build-module doTestFunction

build-module:
	$(CMD_PWSH) -c 'Build-Module'

doShell:
	$(CMD_PWSH) -noe -c 'Import-Module ./$(ODIR)/$(ONAME).psd1'

doTest:
	$(CMD_PWSH) -c 'Import-Module ./$(ODIR)/$(ONAME).psd1;Invoke-Pester;exit'

doTestFunction:
	$(CMD_PWSH) -c 'Import-Module ./$(ODIR)/$(ONAME).psd1;test -Verbose -Debug'

clean:
	$(CMD_DEL) $(ODIR)/*
