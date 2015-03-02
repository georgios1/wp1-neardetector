# - Try to find GEANT4VMC
# Once done this will define
#
#  GEANT4VMC_FOUND - system has GEANT3
#  GEANT4VMC_INCLUDE_DIR - the GEANT3 include directory
#  GEANT4VMC_LIBRARIES - The libraries needed to use GEANT3
#  GEANT4VMC_DEFINITIONS - Compiler switches required for using GEANT3
#

if (GEANT4VMC_INCLUDE_DIR AND GEANT4VMC_LIBRARY_DIR)

  SET (GEANT4VMC_INCLUDE_DIR      GEANT4VMC_INCLUDE_DIR-NOTFOUND)
  SET (GEANT4VMC_LIB_DIR          GEANT4VMC_LIB_DIR-NOTFOUND)
  SET (GEANT4VMC_PLISTS_LIB_DIR   GEANT4VMC_PLISTS_LIB_DIR-NOTFOUND)

  SET (G4ROOT_INCLUDE_DIR         G4ROOT_INCLUDE_DIR-NOTFOUND)
  SET (G4ROOT_LIB_DIR             G4ROOT_LIB_DIR-NOTFOUND)
  SET (G4ROOT_PLISTS_LIB_DIR      G4ROOT_PLISTS_LIB_DIR-NOTFOUND)


endif (GEANT4VMC_INCLUDE_DIR AND GEANT4VMC_LIBRARY_DIR)

MESSAGE(STATUS "\n Looking for GEANT4VMC...")

FIND_PATH(GEANT4VMC_INCLUDE_DIR NAMES TG4G3Units.h PATHS
                                      $ENV{G4_VMC_INSTALL_DIR}/include/geant4vmc
                                      NO_DEFAULT_PATH
)

FIND_PATH(GEANT4VMC_LIBRARY_DIR NAMES libgeant4vmc.so PATHS
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linux
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linuxicc
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linuxx8664gcc
  NO_DEFAULT_PATH
)

if (GEANT4VMC_INCLUDE_DIR AND GEANT4VMC_LIBRARY_DIR)
    MESSAGE(STATUS "found in ${GEANT4VMC_LIBRARY_DIR}")

else (GEANT4VMC_INCLUDE_DIR AND GEANT4VMC_LIBRARY_DIR)

  message(FATAL_ERROR "Could NOT find GEANT4VMC!")

endif (GEANT4VMC_INCLUDE_DIR AND GEANT4VMC_LIBRARY_DIR)


#####################



MESSAGE(STATUS "\n Looking for G4Root...")

FIND_PATH(G4ROOT_INCLUDE_DIR NAMES TG4RootNavigator.h PATHS
                                      $ENV{G4_VMC_INSTALL_DIR}/include/g4root
                                      NO_DEFAULT_PATH
)

FIND_PATH(G4ROOT_LIBRARY_DIR NAMES libg4root.so PATHS
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linux
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linuxicc
  $ENV{G4_VMC_INSTALL_DIR}/lib/tgt_linuxx8664gcc
  NO_DEFAULT_PATH
)

if (G4ROOT_INCLUDE_DIR AND G4ROOT_LIBRARY_DIR)
    MESSAGE(STATUS "found in ${G4ROOT_LIBRARY_DIR}")

else (G4ROOT_INCLUDE_DIR AND G4ROOT_LIBRARY_DIR)

  message(FATAL_ERROR "Could NOT find GEANT4VMC!")

endif (G4ROOT_INCLUDE_DIR AND G4ROOT_LIBRARY_DIR)


#####################


MESSAGE(STATUS "\n Looking for VGM...")

FIND_PATH(VGM_LIBRARY_DIR NAMES libBaseVGM.so PATHS
  $ENV{VGM_INSTALL_DIR}/lib
  NO_DEFAULT_PATH
)

FIND_PATH(VGM_INCLUDE_DIR NAMES  BaseVGM  PATHS
  $ENV{VGM_INSTALL_DIR}/include
  NO_DEFAULT_PATH
)

if (VGM_LIBRARY_DIR AND VGM_INCLUDE_DIR)

  SET(VGM_INCLUDE_DIR ${VGM_INCLUDE_DIR} ${VGM_INCLUDE_DIR}/BaseVGM
                                         ${VGM_INCLUDE_DIR}/ClhepVGM 
                                         ${VGM_INCLUDE_DIR}/Geant4GM
                                         ${VGM_INCLUDE_DIR}/RootGM
                                         ${VGM_INCLUDE_DIR}/VGM
                                         ${VGM_INCLUDE_DIR}/XmlVGM)
  #MESSAGE("include ${VGM_INCLUDE_DIR}")
  MESSAGE(STATUS "found in ${VGM_LIBRARY_DIR}")

else (VGM_LIBRARY_DIR AND VGM_INCLUDE_DIR)

#    message(FATAL_ERROR "Could NOT find VGM!")
    message(STATUS "Could NOT find VGM!")

endif (VGM_LIBRARY_DIR AND VGM_INCLUDE_DIR)


