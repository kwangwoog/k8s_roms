/*
vn $Id: ocean_swan.h 646 2013-01-22 23:35:19Z arango $
*******************************************************************************
** Copyright (c) 2002-2013 The ROMS/TOMS Group                               **
**   Licensed under a MIT/X style license                                    **
**   See License_ROMS.txt                                                    **
*******************************************************************************
**
** Options for Ocean_SWAN Case, waves-ocean (SWAN/ROMS) two-way coupling.
**
** Application flag:   east asian seas
** Input script:       ocean_inlet_test.in
*/

/******************************************************************************
 *  * OPTIONS associated with momentum equations:                               */
#define UV_DRAG_GRID
/* UV_ADV              use to turn ON or OFF advection terms                 */
#define UV_ADV
/* UV_COR              use to turn ON or OFF Coriolis term                   */
#define UV_COR
/* UV_SADVECTION       use to turn ON or OFF splines vertical advection      */
#undef UV_SADVECTION
#define UV_U3HADVECTION
#define UV_C4VADVECTION
/* UV_VIS2             use to turn ON or OFF harmonic horizontal mixing      */
#define UV_VIS2
/* UV_VIS4             use to turn ON or OFF biharmonic horizontal mixing    */
/* UV_QDRAG            use to turn ON or OFF quadratic bottom friction       */
#define UV_QDRAG

/******************************************************************************
 *  * OPTIONS associated with tracers equations:                                */
/* TS_C4HADVECTION     use if 4th-order centered horizontal advection        */
/* TS_MPDATA           use if recursive MPDATA 3D advection                  */
/* TS_U3HADVECTION     use if 3rd-order upstream horiz. advection            */
#define TS_U3HADVECTION
/* TS_C4VADVECTION     use if 4th-order centered vertical advection          */
#define TS_C4VADVECTION
/* TS_DIF2             use to turn ON or OFF harmonic horizontal mixing      */
#define TS_DIF2
/* TS_DIF4             use to turn ON or OFF biharmonic horizontal mixing    */
/* SALINITY            use if having salinity                                */
#define SALINITY
/* NONLIN_EOS          use if using nonlinear equation of state              */
#define NONLIN_EOS
/* QCORRECTION         use if net heat flux correction                       */
/* SCORRECTION         use if freshwater flux correction                     */
/* SOLAR_SOURCE        use if solar radiation source term                    */
#define SOLAR_SOURCE
/* SRELAXATION         use if salinity relaxation as a freshwater flux       */
#undef T_PASSIVE

/******************************************************************************
 * ** Pressure gradient algorithm OPTIONS:                                      */
/* DJ_GRADPS           use if splines density Jacobian (Shchepetkin, 2000)   */
#define DJ_GRADPS

/******************************************************************************
 * ** OPTIONS for surface fluxes formulation using atmospheric boundary layer   **
 * ** (Fairall et al, 1996):                                                    */
/* BULK_FLUXES         use if bulk fluxes computation                        */
#define BULK_FLUXES
#ifdef BULK_FLUXES
# undef ANA_WINDS
# define TAU_TAK
# define IDEAL_TAK
# define ANA_TAIR
# define ANA_PAIR
# define ANA_HUMIDITY
# define ANA_RAIN
# define LONGWAVE
# define ANA_CLOUD
#endif
#define ANA_SRFLUX
#define ANA_SSFLUX
#define ANA_STFLUX
#define ANA_BSFLUX
#define ANA_BTFLUX

/******************************************************************************
 * ** OPTIONS for shortwave radiation:                                          */
/* ALBEDO              use if albedo equation for shortwave radiation        */
/* DIURNAL_SRFLUX      use to impose shortwave radiation local diurnal cycle */
#undef ALBEDO
#undef DIURNAL_SRFLUX

/******************************************************************************
 * ** Model configuration OPTIONS:                                              */
/* SOLVE3D             use if solving 3D primitive equations                 */
#define SOLVE3D
/* CURVGRID            use if curvilinear coordinates grid                   */
#define CURVGRID
/* MASKING             use if land/sea masking                               */
#define MASKING
/* PROFILE             use if time profiling                                 */
/* AVERAGES            use if writing out NLM time-averaged data             */
#define AVERAGES
#define DIAGNOSTICS_UV
/* DIAGNOSTICS_UV      use if writing out momentum diagnostics               */
/* DIAGNOSTICS_TS      use if writing out tracer diagnostics                 */
/* SPHERICAL           use if analytical spherical grid                      */
/******************************************************************************
 * ** OPTION to activate conservative, parabolic spline reconstruction of       **
 * ** vertical derivatives. Notice that there also options (see above) for      **
 * ** vertical advection of momentum and tracers using splines.                 **
 * **                                                                           */
/* SPLINES             use to activate parabolic splines reconstruction      */
#undef SPLINES_VDIFF
#undef SPLINES_VVISC
#define RI_SPLINES

/******************************************************************************
 * ** OPTIONS for analytical fields configuration:                              **
 * **    Any of the analytical expressions are coded in "analytical.F".         */
/* ANA_BPFLUX          use if analytical bottom passive tracers fluxes       */
/* ANA_BSFLUX          use if analytical bottom salinity flux                */
/* ANA_BTFLUX          use if analytical bottom temperature flux             */
/* ANA_FSOBC           use if analytical free-surface boundary conditions    */
/*#define ANA_FSOBC*/
/* ANA_GRID            use if analytical model grid set-up                   */
/* ANA_INITIAL         use if analytical initial conditions                  */
/* ANA_M2OBC           use if analytical 2D momentum boundary conditions     */
/*#define ANA_M2OBC*/
/* ANA_SMFLUX          use if analytical surface momentum stress             */
/*#define ANA_SMFLUX*/
/* ANA_SPFLUX          use if analytical surface passive tracers fluxes      */
/*#define ANA_SPFLUX*/
/* ANA_SRFLUX          use if analytical surface shortwave radiation flux    */
/* ANA_SSFLUX          use if analytical surface salinity flux               */
/*#define ANA_SSFLUX*/
/* ANA_SSH             use if analytical sea surface height                  */
/* ANA_SSS             use if analytical sea surface salinity                */
/* ANA_SST             use if analytical SST and dQdSST                      */
/* ANA_STFLUX          use if analytical surface net heat flux               */
/*#define ANA_STFLUX*/
/* ANA_TAIR            use if analytical surface air temperature             */
/* ANA_TCLIMA          use if analytical tracers climatology                 */
/* ANA_TOBC            use if analytical tracers boundary conditions         */
/* ANA_VMIX            use if analytical vertical mixing coefficients        */
/* ANA_WINDS           use if analytical surface winds                       */
/* ANA_WWAVE           use if analytical wind induced waves                  */

/******************************************************************************
 * ** OPTIONS for horizontal mixing of momentum:                                */
/* VISC_GRID           use to scale viscosity coefficient by grid size       */
/* MIX_S_UV            use if mixing along constant S-surfaces               */
#define MIX_S_UV
/* MIX_GEO_UV          use if mixing on geopotential (constant Z) surfaces   */

/******************************************************************************
 * ** OPTIONS for horizontal mixing of tracers:                                 */
/* MIX_S_TS            use if mixing along constant S-surfaces               */
/* MIX_GEO_TS          use if mixing on geopotential (constant Z) surfaces   */
#define MIX_GEO_TS
/* MIX_ISO_TS          use if mixing on epineutral (constant RHO) surfaces   */

/******************************************************************************
 * ** OPTIONS for vertical turbulent mixing scheme of momentum and tracers      **
 * ** (activate only one closure):                                              */
/* BVF_MIXING          use if Brunt-Vaisala frequency mixing                 */
/* GLS_MIXING          use if Generic Length-Scale mixing                    */
/* MY25_MIXING         use if Mellor/Yamada Level-2.5 closure                */
/* LMD_MIXING          use if Large et al. (1994) interior closure           */
#define LMD_MIXING

/* OPTIONS for the Generic Length-Scale closure (Warner et al., 2005):       **
 * **   The default horizontal advection is third-order upstream bias.  The     **
 * **   default vertical advection is 4th-order centered advection.             */
#ifdef GLS_MIXING
/* CANUTO_A            use if Canuto A-stability function formulation        */
/* CANUTO_B            use if Canuto B-stability function formulation        */
/* CHARNOK             use if Charnok surface roughness from wind stress     */
/* CRAIG_BANNER        use if Craig and Banner wave breaking surface flux    */
/* KANTHA_CLAYSON      use if Kantha and Clayson stability function          */
# define KANTHA_CLAYSON
/* K_C2ADVECTION       use if 2nd-order centered advection                   */
/* K_C4ADVECTION       use if 4th-order centered advection                   */
/* N2S2_HORAVG         use if horizontal smoothing of buoyancy/shear         */
# define N2S2_HORAVG
/* ZOS_HSIG            use if surface roughness from wave amplitude          */
/* TKE_WAVEDISS        use if wave breaking surface flux from wave amplitude */
#endif

/* OPTIONS for the Mellor/Yamada level 2.5 closure:                          */
/*   The default horizontal advection is third-order upstream bias.  The     */
/*   default vertical advection is 4th-order centered advection.             */
#ifdef MY25_MIXING
/* N2S2_HORAVG         use if horizontal smoothing of buoyancy/shear         */
# define N2S2_HORAVG
/* KANTHA_CLAYSON      use if Kantha and Clayson stability function          */
# define KANTHA_CLAYSON
/* K_C2ADVECTION       use if 2nd-order centered advection                   */
/* K_C4ADVECTION       use if 4th-order centered advection                   */
#endif

/* OPTIONS for the Large et al. (1994) K-profile parameterization mixing:    */
#ifdef LMD_MIXING
/* LMD_BKPP            use if bottom boundary layer KPP mixing               */
# define LMD_BKPP
/* LMD_CONVEC          use to add convective mixing due to shear instability */
# define LMD_CONVEC
/* LMD_DDMIX           use to add double-diffusive mixing                    */
/* LMD_NONLOCAL        use if nonlocal transport                             */
# define LMD_NONLOCAL
/* LMD_RIMIX           use to add diffusivity due to shear instability       */
# define LMD_RIMIX
/* LMD_SHAPIRO         use if Shapiro filtering boundary layer depth         */
/* LMD_SKPP            use if surface boundary layer KPP mixing              */
# define LMD_SKPP
#endif

/******************************************************************************
 * ** Lateral boundary conditions OPTIONS:                                      */
/* RADIATION_2D        use if tangential phase speed in radiation conditions */
#define RADIATION_2D

/******************************************************************************
 * ** OPTION to impose a sponge layer near the lateral boundary:                */
/* SPONGE              use if enhanced viscosity/diffusion areas             */

/******************************************************************************
 * ** OPTIONS for tidal forcing at open boundaries:                             */
/* SSH_TIDES           use if imposing tidal elevation                       */
#undef SSH_TIDES
/* UV_TIDES            use if imposing tidal currents                        */
#undef UV_TIDES
/* RAMP_TIDES          use if ramping (over one day) tidal forcing           */
/* FSOBC_REDUCED       use if SSH data and reduced physics conditions        */
/* ADD_FSOBC           use to add tidal elevation to processed OBC data      */
#ifdef SSH_TIDES
# define ADD_FSOBC
#endif
#ifdef UV_TIDES
/* ADD_M2OBC           use to add tidal currents  to processed OBC data      */
# define ADD_M2OBC
#endif

/******************************************************************************
 * ** OPTIONS for reading and processing of climatological fields:              */
/* M2CLIMATOLOGY       use if processing 2D momentum climatology             */
/* M3CLIMATOLOGY       use if processing 3D momentum climatology             */
/* TCLIMATOLOGY        use if processing tracers climatology                 */
/*!#define TCLIMATOLOGY*/
/* ZCLIMATOLOGY        use if processing SSH climatology                     */

/* OPTIONS to nudge climatology data (primarily in sponge areas):            */
/* M2CLM_NUDGING       use if nudging 2D momentum climatology                */
/* M3CLM_NUDGING       use if nudging 3D momentum climatology                */
/* TCLM_NUDGING        use if nudging tracers climatology                    */
/*!#define TCLM_NUDGING*/

/******************************************************************************
 * ** OPTIONS for two-way coupling to other models:                             */
/* REFDIF_COUPLING     use if coupling to REFDIT wave model                  */
/* SWAN_COUPLING       use if coupling to SWAN wave model                    */
/* WRF_COUPLING        use if coupling to WRF atmospheric model              */

/* Nearshore and shallow water model OPTIONS:                                */
/* WET_DRY             use to activate wetting and drying                    */
/* NEARSHORE_MELLOR05  use to activate radiation stress terms (Mellor 2005). */
/* NEARSHORE_MELLOR08  use to activate radiation stress terms (Mellor 2008). */

/******************************************************************************
 * ** Coupling Library OPTIONS:                                                 */
/* ESMF_LIB            use Earth System Modeling Framework Library           */
/* MCT_LIB             use Model Coupling Toolkit Library                    */

/* OPTION to avoid writing current date and CPP options to NetCDF file       **
 * ** headers. This is used to compare serial and parallel solutions where      **
 * ** the UNIX command "diff" is used between NetCDF files. It will only        **
 * ** tell us that the binary files are different or not. Finding the           **
 * ** parallel bug is complete different story.                                 */
/* DEBUGGING           use to activate parallel debugging switch             */
/*#define DEBUGGING*/


/*
** Biological model options
*/
#undef  BIO_FENNEL
#undef  ECOSIM
#undef  NEMURO
#undef  NPZD_FRANKS
#undef  NPZD_IRON
#undef  NPZD_POWELL

#ifdef BIO_FENNEL
# undef CARBON
# define OXYGEN
# define PO4_TAK
# define DENITRIFICATION
# undef NO3_DENITRIFICATION_TAK
# define BIO_SEDIMENT
# undef DIAGNOSTICS_BIO
#endif

#if defined ECOSIM || defined BIO_FENNEL
# define ANA_SPFLUX
# define ANA_BPFLUX
# define ANA_CLOUD
#endif

#if defined NEMURO
# define HOLLING_GRAZING
# undef  IVLEV_EXPLICIT
# define ANA_SPFLUX
# define ANA_BPFLUX
#endif

#if defined NPZD_FRANKS || defined NPZD_POWELL
# define ANA_SPFLUX
# define ANA_BPFLUX
#endif

#if defined NPZD_IRON
# define ANA_SPFLUX
# define ANA_BPFLUX
# undef  IRON_LIMIT
# undef  IRON_RELAX
#endif

#if defined BULK_FLUXES || defined ECOSIM
# define ANA_CLOUD
# define PAPA_CLM
#endif






