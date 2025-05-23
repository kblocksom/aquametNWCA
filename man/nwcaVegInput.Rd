% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CreateClassMethods.r
\name{nwcaVegInput}
\alias{nwcaVegInput}
\title{Create data frames for function input - alternative version}
\usage{
nwcaVegInput(
  sampID = "UID",
  tvar,
  vascIn,
  taxon_name,
  taxa,
  state = "STATE",
  coeReg = "USAC_REGION",
  cValReg = "STATE"
)
}
\arguments{
\item{sampID}{A character vector containing the name(s) of
variable(s) necessary to identify unique samples, 'UID' by default}

\item{tvar}{String with the level of taxonomy
('USDA_NAME','GENUS','FAMILY')}

\item{vascIn}{Data frame with vegetation cover data, having
the following variables:
\itemize{

\item sampID: Variable(s) found in the argument \emph{sampID}

\item PLOT:  Plot number of data (1 to 5 possible)

\item \emph{state}: Two-letter state code value associated with native status
  (will match name specified in function arguments)

\item \emph{coeReg}: U.S. Army Corps of Engineers region code value
  (will match name specified in function arguments)

\item \emph{cValReg} (as specified in function arguments): Site region associated with Coefficient of
Conservatism value (will match name specified in function arguments)

\item variable name provided in \emph{taxon_name}: Taxon name, based on
  USDA PLANTS names, supplemented with
  NWCA names, if not in USDA PLANTS

\item COVER: Percentage estimated vegetation cover by TAXON in PLOT
}}

\item{taxon_name}{String containing the name of variable for taxon name in
\emph{vascIn} and in taxalists.}

\item{taxa}{Data frame containing USDA_NAME, GENUS, CATEGORY,
GROWTH_HABIT, and DURATION variables. Dataset taxaNWCA is the
default if not specified. These variables are assumed to be
populated with abbreviations as found in USDA PLANTS database.}

\item{state}{String containing the name of the state in \emph{vascIn},
with default value of 'STATE'}

\item{coeReg}{String containing the name of the U.S. Army Corps of Engineers
region in \emph{vascIn} associated with Wetland Indicator Status,
with default value of 'USAC_REGION'}

\item{cValReg}{Character string with name of variable containing
region associated with Coefficients of Conservatism.}
}
\value{
A list containing two data frames. The first data frame summarizes
  data by \emph{sampID} variables and TAXON and contains sampID variables,
  \emph{cValReg} variable, \emph{coeReg}, TAXON, NUM, XABCOV, DISTINCT, and NPLOTS. NUM is the
  number of plots in which taxon occurs, and XABCOV is the mean absolute
  COVER across plots. DISTINCT is the value 1 assigned to each row. NPLOTS is
  the number of plots sampled.

  The second summarizes by \emph{sampID} variables, PLOT, and TAXON. Each
  data frame contains sampID variables, PLOT, \emph{cValReg} variable, \emph{coeReg}, TAXON,
  COVER, and DISTINCT. DISTINCT assigns the value for each taxon as 1 if the
  taxon has COVER>0 or 0 if not. COVER is the sum of the COVER variable by
  sampID variables, PLOT, and TAXON.
}
\description{
This internal function merges the inputs of
plant cover data and taxalist and summarizes by the taxonomic
level specified. Not intended for use on its own.
}
\examples{
head(VascPlantEx)
data(taxaNWCA)

outEx <- nwcaVegInput(
  sampID = "UID", "GENUS", VascPlantEx,
  taxon_name = "USDA_NAME", taxaNWCA, cValReg = "STATE"
)
head(outEx$byUID)
head(outEx$byPlot)
}
\author{
Karen Blocksom \email{blocksom.karen@epa.gov}
}
