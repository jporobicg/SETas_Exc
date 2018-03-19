# ON THE ROAD TO ATLANTIS: A calibration exercise to facilitate group learning and identify best practices in calibrating Atlantis ecosystem models

## Background:
Understanding, and accounting for, various types of model uncertainty in large dynamic and deterministic models presents an insurmountable challenge, but is necessary to support robust management approaches. While the global ecosystem modelling community is starting to obtain estimates of uncertainty related to data input and model structure (process understanding), very few studies have assessed the influence of the persons (skill and experience) undertaking model calibration. This is despite calibration being a fundamental step to ensure that model results match the real system.
The Atlantis model is now one of the most widely adopted marine ecosystem models internationally. We propose that a group of around 10-20 research scientists with varying levels of Atlantis experience and ecological based knowledge calibrate the same parameterised model (SETasDemo) over a 12 month equivalent period. The main aim of this exercise is to allow the Atlantis community and end-users to optimise the efficiency of implementation and calibration by sharing experiences and knowledge. Some secondary aims are to better understand parameter sensitivity and how biases in parameter preferences could propagate over time and to share and develop new tools to assist model calibration and assessment.

## Desired outcomes:
Identification of the main parameters ‘tuned’ and the sensitivity of those parameters;
Develop a proposed systematic approach for model calibration that is supported by adequate techniques, prior knowledge and expert judgement.
A better working training (demo) model for future Atlantis ecosystem modellers
Publish a research paper(s) of findings (Best practices or rules of thumb / skill based assessment / sensitivity analysis / user error – how do differently calibrated models respond to scenario perturbations or shocks to the system, e.g. high temperature or drastic increases in F?)

## Specifications of the exercise:
All participants will start off with the (most recent) version of the Atlantis code and the same version of the demo model in addition to some background information about the functional groups.
The model: SETas Demo model (32 functional groups – 10 vertebrates and 22 inverts, and 11 boxes including 6 boundary boxes). The updated files for this model can be uploaded on the repository.
The mission: Relative biomasses of all functional groups must be as close to stable and within 20% of its initial conditions after 20 years from the end of your burn-in period.


## Rules of the game:
**Do not** make changes to the:
* Trunk code;
* Group.csv file; and
* Fisheries parameter file (but Fisheries (constant F) must be turned on).
**Only minimal changes** should occur to:
* Initial conditions file;
* Process related parameters and flags (e.g. type of recruitment);
* Horizontal spatial parameters (e.g. recruitment box distribution; distribution including % that migrates);
* Temporal parameters (e.g., dates of recruitment, seasonal distribution, etc.);

**Everything else is fair game.**
After every 8 hours of calibrating (we recommend 2 hrs a week, although this is entirely up to you), the following files must be saved in a common repository (TBD) for later comparative analysis:
* 1. Any documentation of which parameters where changed for what group and the reason for change (a spreadsheet for example).
* 2. A zipped up folder of the most recent output files
* 3. The latest Boil.prm file

Notes: A 30-year SETas model run takes about 40 minutes, reducing limitations due to computer power. By allocating a specific (8 hr) time period in which calibration takes place and results are passed on, we eliminate potential limitations due to differences in time availability. However, given that people with higher levels of expertise will typically make a larger number of changes per time allocated, documentation of parameter changes will be vital.
We will look to obtain some time-series data for some of the functional groups to assessing fitting.

Completion date: The exercise will finish in approx. 12 months, when everyone has completed and saved at least 12 output and Biol.prm files. We have already secured some funds to hold a workshop late next year to discuss results and write up a paper.

**Instructions to get started:**
* 1. Download the most recent version of the code. Be careful not to override prior versions being used by existing models.
* 2. Download the most recent version of the SETas model from the SVN depository: https://svnserv.csiro.au/svn/atlantis/runFiles/trunk/SETas_model_Trunk_Stripped/
* 3. Familiarise yourself with the functional groups (Groups_compositions.doc) and the model domain (SETas_bound.pdf, in the SETas model folder).
* 4. Complete a short questionnaire (Questionaire.xls in the dropbox folder) before commencing calibration.
* 5. Re-read through ‘On the road to Atlantis.doc’, in particularly the rules of the game on pg2.
* 6. Start calibrating – taking detailed notes of changes (as per your usual method) and timing how long each sitting is. After every 8 hrs of calibrating, save input and output files. These can then be emailed to me and Javier or placed in the dropbox folder (or an equivalent).
