# mei_tutorial
Tutorial on the basics of MEI

## Installation
1. Clone the repository 
2. Create your own branch (in which you will push your output files)
3. Go into your mei_tutorial local copy and run:
- `docker-compose up`

4. When it finishes (you will see something similar to `Starting mei_tutorial_pymei_1 ... done`), open a new terminal (go into your mei_tutorial local copy again) and run:
- `docker-compose exec pymei bash`
  - `$> ipython`
  ```python
  import pymei
  ```
## Instructions
- The path to the template file is: `/opt/drafts/MEI_CMN-general-structure.mei`
- Edit this file using pymei and save the result as `/opt/drafts/output_with_pymei.mei`
- Check the result in [Verovio's MEI Viewer](https://www.verovio.org/mei-viewer.xhtml)
- Push the resulting MEI file into your own branch

## PyMEI Documentation
The `doc` and `element` are just variables used here for reference. 

`doc` refers to an `MeiDocument` object.

`element` and `element2` refer to `MeiElement` objects.

![alt text](https://github.com/martha-thomae/mei_tutorial/blob/master/drafts/pymei_documentation.png)
