# LaTeX-Templates
LaTeX templates for different ETH labroratory courses, Master's thesis and the UZH CHE311 multiple step synthesis labroratory course .

## Setup templates
- Download folder with desired template (use e.g. https://download-directory.github.io/)
- Go to Overleaf, click on `New Project` and then `Upload Project`, upload the .zip file you just downloaded

## Most important stuff added by the templates
- `\pcref{label}` is a new referencing type (e.g. "(Figure 1)")
- `\lilyref{label}` is a new referencing type (e.g. "(see Figure 1)")
- `\segment` can be used as a start of subsection in experimental, adapted from the Erich Meister template
- new environment `Scheme` adds the option to create schemes instead of figures (use `\begin{scheme}` instead of `\begin{figure}`) This is only really useful for AOCPII reports.
- new column type added for tables `C{width}` makes columns which are centered with adjustable width (e.g. `\begin{tabular}{C{0.1\linewidth}}`...)

### Things only found in Master's thesis template
- `\labeledgraphic{width}{filename}{label}` adds the option to add figures with a label on the top left, which is generated via tikz. This is used for cases where two or more plots are added to one figure, so they can be labeled and refered to as Fig. 4a, b, etc.

The Institute has to be changed in the .cls file because I was too lazy to change that.

