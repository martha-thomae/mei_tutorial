# mei_tutorial
Tutorial on the basics of MEI

## Installation
After cloning the repo, go into your mei_tutorial local copy and run:
- `docker-compose up`

When it finishes, open a new terminal (go into your mei_tutorial local copy again) and run:
- `docker-compose exec pymei bash`
  - `$> ipython`
  ```python
  import pymei
  ```
## Instructions
- The path to the template file is: `/opt/drafts/MEI_CMN-general-structure.mei`
- Edit this file using pymei and save the result as `output_<last_name>.mei`
- Check the result in [Verovio's MEI Viewer](https://www.verovio.org/mei-viewer.xhtml)
- Push the resulting MEI file

## PyMEI Documentation
![alt text](https://github.com/martha-thomae/mei_tutorial/blob/master/drafts/pymei_documentation.png)
