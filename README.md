# A sensitivity analysis of pesticide concentrations in California Central Valley vernal pools

In this study, the Pesticide Water Calculator (PWC) model was implemented with deterministic and probabilistic approaches and parameterized for three agricultural vernal pool watersheds located in the San Joaquin River basin in the Central Valley of California.

## Brief Discription

An MC shell wrapper was developed to execute PRZM and VVWM models, sample input parameters and to characterize parameter sensitivity, using R version 1.1.414 (RStudio Team, 2018). The R scripts were structured to set up a local execution environment; load initial PRZM (PRZM.inp) and VVWM input files (vvwmTransfer.txt); parameterize PWC inputs (both PRZM and VVWM); create the PRZM and VVWM inputs distributions; execute PWC by executing PRZM and VVWM; write an input/output file for each Monte Carlo simulation; load input/outputs; and then execute all Monte Carlo simulations (Figure below). PRZM and VVWM output files were saved as R objects which were read back as two-dimensional data frames for sensitivity analysis and post-processing in R. Input parameters were repeatedly sampled using the Latin Hypercube (LH) technique to ensure that sampling points were distributed evenly across all possible values (McKay et al., 1979). A list of inputs sampled, their description, and the range limits of each distribution can be found in published article below.

### Prerequisites

R Studio https://rstudio.com/
PWC https://www.epa.gov/sites/production/files/2016-05/pwc_v1.52.zip


### Installing

git clone https://github.com/SumathyS/sinnathamby_pwc.git


## Script Structure

![picture](figures/script.png)



## Published work

* [Peer Reviewed Article](https://www.sciencedirect.com/science/article/pii/S0269749119343088) - Environmental Pollution
* [Presentation](https://www.researchgate.net/publication/337032938_Sensitivity_analysis_for_pesticide_transport_in_a_vernal_pool_watershed_using_the_Pesticide_Water_Calculator) - iEMSs 2018


## Authors

*  [Sinnathamby Sumathy](https://sumathys.github.io/)
*  [Purucker Tom](https://tom-purucker.appspot.com/)


## Acknowledgments
This research was supported in part by an appointment to the Research Program at the at the National Exposure Research Laboratory in the Office of Research Development, U.S. Environmental Protection Agency, administered by the Oak Ridge Institute for Science and Education through Interagency Agreement No. DW8992298301 between the United States Department of Energy and the United States Environmental Protection Agency. 

