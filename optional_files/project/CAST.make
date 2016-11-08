# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x86
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x86_debug.exe
  OBJDIR = obj/x86/Debug
  DEFINES += -DCAST_DEBUG_DROP_EXCEPTIONS
  INCLUDES +=
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -fopenmp
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_debug.exe
  OBJDIR = obj/x64/Debug
  DEFINES += -DCOMPILEX64 -DCAST_DEBUG_DROP_EXCEPTIONS
  INCLUDES +=
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -fopenmp
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x86_release.exe
  OBJDIR = obj/x86/Release
  DEFINES +=
  INCLUDES +=
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O3 -Wextra -Wall -std=c++0x -pedantic -fopenmp -static
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -s -fopenmp
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_release.exe
  OBJDIR = obj/x64/Release
  DEFINES += -DCOMPILEX64
  INCLUDES +=
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O3 -Wextra -Wall -std=c++0x -pedantic -fopenmp -static
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -s -fopenmp
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),testing_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x86_testing.exe
  OBJDIR = obj/x86/Testing
  DEFINES += -DGOOGLE_MOCK
  INCLUDES += -I../includes/gtest
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -flto -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -flto -s -fopenmp ../linux_precompiled_libs/libgmock.a -I ../optional_files/includes/
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),testing_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_testing.exe
  OBJDIR = obj/x64/Testing
  DEFINES += -DCOMPILEX64 -DGOOGLE_MOCK
  INCLUDES += -I../includes/gtest
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -flto -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s -fopenmp ../linux_precompiled_libs/libgmock.a -I ../optional_files/includes/
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_testing_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST.exe
  OBJDIR = obj/x86/Armadillo_Testing
  DEFINES += -DGOOGLE_MOCK -DUSE_ARMADILLO -DARMA_DONT_USE_WRAPPER
  INCLUDES += -I../includes/gtest -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -flto -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes -I ../includes -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -flto -s -fopenmp ../linux_precompiled_libs/libgmock.a ../linux_precompiled_libs/libopenblas.a ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_testing_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST.exe
  OBJDIR = obj/x64/Armadillo_Testing
  DEFINES += -DCOMPILEX64 -DGOOGLE_MOCK -DUSE_ARMADILLO -DARMA_DONT_USE_WRAPPER
  INCLUDES += -I../includes/gtest -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -flto -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes -I ../includes -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s -fopenmp ../linux_precompiled_libs/libgmock.a ../linux_precompiled_libs/libopenblas.a ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_release_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_armadillo_release.exe
  OBJDIR = obj/x86/Armadillo_Release
  DEFINES += -DUSE_ARMADILLO
  INCLUDES += -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -flto -O3 -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes -DARMA_DONT_USE_WRAPPER -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -flto -s -fopenmp ../linux_precompiled_libs/libopenblas.a -I ../optional_files/includes/ -DARMA_DONT_USE_WRAPPER ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_release_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_armadillo_release.exe
  OBJDIR = obj/x64/Armadillo_Release
  DEFINES += -DCOMPILEX64 -DUSE_ARMADILLO
  INCLUDES += -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -flto -O3 -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../optional_files/includes -DARMA_DONT_USE_WRAPPER -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -flto -s -fopenmp ../linux_precompiled_libs/libopenblas.a -I ../optional_files/includes/ -DARMA_DONT_USE_WRAPPER ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_debug_x86)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_armadillo_debug.exe
  OBJDIR = obj/x86/Armadillo_Debug
  DEFINES += -DCAST_DEBUG_DROP_EXCEPTIONS -DUSE_ARMADILLO
  INCLUDES += -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../includes -DARMA_DONT_USE_WRAPPER -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -fopenmp ../linux_precompiled_libs/libopenblas.a -I ../optional_files/includes/ -DARMA_DONT_USE_WRAPPER ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),armadillo_debug_x64)
  RESCOMP = windres
  TARGETDIR = ../build
  TARGET = $(TARGETDIR)/CAST_linux_x64_armadillo_debug.exe
  OBJDIR = obj/x64/Armadillo_Debug
  DEFINES += -DCOMPILEX64 -DCAST_DEBUG_DROP_EXCEPTIONS -DUSE_ARMADILLO
  INCLUDES += -I../includes/armadillo
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -Og -Wextra -Wall -std=c++0x -pedantic -fopenmp -static -I ../includes -DARMA_DONT_USE_WRAPPER -lgfortran
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -fopenmp ../linux_precompiled_libs/libopenblas.a -I ../optional_files/includes/ -DARMA_DONT_USE_WRAPPER ../linux_precompiled_libs/liblapack.a -lgfortran
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/PCA.o \
	$(OBJDIR)/Path_perp.o \
	$(OBJDIR)/configuration.o \
	$(OBJDIR)/configurationHelperfunctions.o \
	$(OBJDIR)/coords.o \
	$(OBJDIR)/coords_atoms.o \
	$(OBJDIR)/coords_bias.o \
	$(OBJDIR)/coords_io.o \
	$(OBJDIR)/coords_io_AMBER.o \
	$(OBJDIR)/energy.o \
	$(OBJDIR)/energy_int_aco.o \
	$(OBJDIR)/energy_int_aco_pot.o \
	$(OBJDIR)/energy_int_amoeba.o \
	$(OBJDIR)/energy_int_amoeba_pot.o \
	$(OBJDIR)/energy_int_mopac.o \
	$(OBJDIR)/energy_int_terachem.o \
	$(OBJDIR)/gb_solv.o \
	$(OBJDIR)/gbsa.o \
	$(OBJDIR)/interpolation.o \
	$(OBJDIR)/main.o \
	$(OBJDIR)/matop.o \
	$(OBJDIR)/md.o \
	$(OBJDIR)/mpi_cast.o \
	$(OBJDIR)/neb.o \
	$(OBJDIR)/optimization.o \
	$(OBJDIR)/optimization_grid.o \
	$(OBJDIR)/optimization_mc.o \
	$(OBJDIR)/optimization_ts.o \
	$(OBJDIR)/pathopt.o \
	$(OBJDIR)/pme.o \
	$(OBJDIR)/pme_fep.o \
	$(OBJDIR)/reaccoord.o \
	$(OBJDIR)/startopt.o \
	$(OBJDIR)/startopt_ringsearch.o \
	$(OBJDIR)/startopt_solvadd.o \
	$(OBJDIR)/tinker_parameters.o \
	$(OBJDIR)/tinker_refine.o \
	$(OBJDIR)/configurationTest.o \
	$(OBJDIR)/scon_mathmatrix_test.o \
	$(OBJDIR)/scon_traits_test.o \
	$(OBJDIR)/testing_main.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking CAST
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning CAST
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/PCA.o: ../../src/PCA.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Path_perp.o: ../../src/Path_perp.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/configuration.o: ../../src/configuration.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/configurationHelperfunctions.o: ../../src/configurationHelperfunctions.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/coords.o: ../../src/coords.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/coords_atoms.o: ../../src/coords_atoms.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/coords_bias.o: ../../src/coords_bias.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/coords_io.o: ../../src/coords_io.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/coords_io_AMBER.o: ../../src/coords_io_AMBER.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy.o: ../../src/energy.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_aco.o: ../../src/energy_int_aco.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_aco_pot.o: ../../src/energy_int_aco_pot.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_amoeba.o: ../../src/energy_int_amoeba.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_amoeba_pot.o: ../../src/energy_int_amoeba_pot.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_mopac.o: ../../src/energy_int_mopac.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/energy_int_terachem.o: ../../src/energy_int_terachem.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/gb_solv.o: ../../src/gb_solv.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/gbsa.o: ../../src/gbsa.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/interpolation.o: ../../src/interpolation.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/main.o: ../../src/main.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/matop.o: ../../src/matop.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/md.o: ../../src/md.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/mpi_cast.o: ../../src/mpi_cast.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/neb.o: ../../src/neb.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/optimization.o: ../../src/optimization.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/optimization_grid.o: ../../src/optimization_grid.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/optimization_mc.o: ../../src/optimization_mc.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/optimization_ts.o: ../../src/optimization_ts.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/pathopt.o: ../../src/pathopt.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/pme.o: ../../src/pme.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/pme_fep.o: ../../src/pme_fep.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/reaccoord.o: ../../src/reaccoord.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/startopt.o: ../../src/startopt.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/startopt_ringsearch.o: ../../src/startopt_ringsearch.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/startopt_solvadd.o: ../../src/startopt_solvadd.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tinker_parameters.o: ../../src/tinker_parameters.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tinker_refine.o: ../../src/tinker_refine.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/configurationTest.o: ../../gtest/configurationTest.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/scon_mathmatrix_test.o: ../../gtest/scon_mathmatrix_test.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/scon_traits_test.o: ../../gtest/scon_traits_test.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/testing_main.o: ../../gtest/testing_main.cc
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif