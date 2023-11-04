# LaTeX-Templates
LaTeX template for the ETH spectroscopy laboratory course of the 5. semester

Setup up templates:
  -Download folder with desired template (use e.g. https://download-directory.github.io/)
  -Go to Overleaf, click on "New Project" and then "Upload Project", upload the .zip file you just downloaded

Most important stuff added by the template:
  -\pcref{} ; new referencing type (e.g. "(Figure 1)")
  -\lilyref{} ; new referencing type (e.g. "(see Figure 1)")
  -\segment ; can be used as a start of subsection in experimental, adapted from the Erich Meister template
  -new environment "Scheme" ; adds the option to create schemes instead of figures (use \begin{scheme} instead of \begin{figure})
  -new column type added for tables "C{}" ; columns are centered and you can adjust the width of the column (e.g. \begin{tabular}{C{0.1\linewidth}}
  
