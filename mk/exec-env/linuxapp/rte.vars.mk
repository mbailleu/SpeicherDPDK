# SPDX-License-Identifier: BSD-3-Clause
# Copyright(c) 2010-2014 Intel Corporation

#
# exec-env:
#
#   - define EXECENV_CFLAGS variable (overridden by cmdline)
#   - define EXECENV_LDFLAGS variable (overridden by cmdline)
#   - define EXECENV_ASFLAGS variable (overridden by cmdline)
#   - may override any previously defined variable
#
# examples for RTE_EXEC_ENV: linuxapp, bsdapp
#
ifeq ($(CONFIG_RTE_BUILD_SHARED_LIB),y)
EXECENV_CFLAGS  = -pthread
else
EXECENV_CFLAGS  = -pthread
endif

EXECENV_LDLIBS  =
EXECENV_ASFLAGS =

ifeq ($(CONFIG_RTE_BUILD_SHARED_LIB),y)
EXECENV_LDLIBS += -lgcc_s
endif

# force applications to link with gcc/icc instead of using ld
LINK_USING_CC := 1

# For shared libraries
EXECENV_LDFLAGS += -export-dynamic
# Add library to the group to resolve symbols
EXECENV_LDLIBS  += -ldl

export EXECENV_CFLAGS EXECENV_LDFLAGS EXECENV_ASFLAGS EXECENV_LDLIBS
