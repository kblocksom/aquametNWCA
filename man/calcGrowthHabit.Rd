% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calcGrowthHabit.r
\name{calcGrowthHabit}
\alias{calcGrowthHabit}
\title{Calculate growth habit metrics}
\usage{
calcGrowthHabit(vascIn, sampID = "UID")
}
\arguments{
\item{vascIn}{Data frame containing cover data summarized by
UID and TAXON, with the following fields:
\itemize{
    \item sampID: Variable(s) identified in \emph{sampID} argument

    \item TAXON: Taxon name

    \item GROWTH_HABIT: USDA PLANTS GROWTH_HABIT variable with valid
    values FORB, GRAMINOID, HERB, SHRUB, SUBSHRUB, TREE, VINE,
    NONVASCULAR, combinations of these, or blank

    \item GRH_ALT (optional): Combinations of GROWTH_HABIT variable
    as used in NWCA. Created in code if not supplied by user. Valid
    values include FORB, GRAMINOID, SHRUB, SSHRUB_FORB, SSHRUB_SHRUB,
    TREE, TREE_SHRUB, VINE, VINE_SHRUB.

    \item TREE_COMB (optional): Indicator (1/0) for values of
    TREE or TREE_SHRUB in GRH_ALT.
    If not supplied by user, will be created in code

    \item SHRUB_COMB (optional): Indicator value (0/1) for GRH_ALT
    values of SHRUB, SSHRUB_FORB, or SSHRUB_SHRUB. Created in code
    if not supplied by user.

    \item HERB (optional): Indicator value (0/1) for GRH_ALT values
    of GRAMINOID or FORB. Created in code if not supplied by user.

    \item XABCOV: Mean percent cover of taxon across plots

    \item TOTN: Number of taxa in sample

    \item sXRCOV: proportion of summed cover across all taxa
    (XTOTABCOV) represented by taxon in sample

    \item NWCA_NATSTAT (optional): Native status variable with categories
    of 'NAT', 'ADV', 'CRYP', 'INTR', 'UND'
   }}

\item{sampID}{A character vector containing the name(s) of variable(s)
necessary to identify unique samples, 'UID' by default}
}
\value{
Data frame containing \emph{sampID} variables, PARAMETER, RESULT,
  where values of PARAMETER consist of the metric name concatenated with
  trait value (represented as TRAITNM below):
\itemize{
\item N_TRAITNM: Number of taxa with trait

\item PCTN_TRAITNM: Number of taxa with trait as percentage of \emph{TOTN}

\item XABCOV_TRAITNM: Sum of \emph{XABCOV} values across taxa with trait

\item XRCOV_TRAITNM: Sum of \emph{sXRCOV} values across taxa with trait
}
If NWCA_NATSTAT is in the input data frame, the same set except
'N_' metrics is calculated for native species and
alien + cryptogenic species, with metric names suffixes of
_NAT and _AC, respectively.

#' A list of metric descriptions is provided in the document named 
\href{https://github.com/USEPA/aquametNWCA/blob/main/inst/VascPlant_Metric_Descriptions.pdf}{VascPlant_Metric_Descriptions.pdf}
}
\description{
This function calculates all growth habit metrics, with
additional metrics if NWCA_NATSTAT variable is included
in input data frame.
}
\details{
Both GROWTH_HABIT and NWCA_NATSTAT variables are recoded to fewer
categories. Taxa with 'UND' as native status are excluded.
}
\examples{
head(VascPlantEx)
exPlant <- prepareData(VascPlantEx,
  taxon_name = "USDA_NAME",
  inTaxa = taxaNWCA, inNat = ccNatNWCA, inCVal = ccNatNWCA,
  inWIS = wisNWCA, cValReg = "STATE"
)

ghEx <- calcGrowthHabit(exPlant$byUIDspp)

head(ghEx)
unique(ghEx$PARAMETER)
}
\references{
US Environmental Protection Agency. 2016. National Wetland
Condition Assessment: 2011 Technical Report. EPA-843-R-15-006. US
Environmental Protection Agency, Washington, DC.
}
\author{
Karen Blocksom \email{Blocksom.karen@epa.gov}
}
