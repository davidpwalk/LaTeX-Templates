# LaTeX-Templates
LaTeX templates for different ETH labroratory courses, Master's thesis and the UZH CHE311 multiple step synthesis labroratory course. The most advanced and up to date template for reports is the `ReportDW` template in the ETH directory. For a thesis, I suggest using the ETH thesis template. If you are new to LaTeX, the `Guide.pdf` should be helpful.

## Setup templates
- Download folder with desired template
- Open template in any LaTeX editor (in Overleaf, click on `New Project` and then `Upload Project`, upload the .zip file you just downloaded)

## Most important stuff added by the templates
- `\pcref{label}` is a new referencing type (e.g. "(Figure 1)")
- `\lilyref{label}` is a new referencing type (e.g. "(see Figure 1)")
- new environment `Scheme` adds the option to create schemes instead of figures (use `\begin{scheme}` instead of `\begin{figure}`) This is only really useful for AOCPII reports.
- new column type added for tables `C{width}` makes columns which are centered with adjustable width (e.g. `\begin{tabular}{C{0.1\linewidth}}`...)
- New environment `Scheme` adds the option to create schemes instead of figures (use `\begin{scheme}` instead of `\begin{figure}`) This is only really useful for AOCPII reports.
- New column types added for tables `C{width}`, `L{width}` and `R{width}` makes columns which are centered/raggedright/raggedleft with adjustable width (e.g. `\begin{tabular}{C{0.1\linewidth}}`...)

A longer description of the added stuff is found in the `Guide.pdf`.

