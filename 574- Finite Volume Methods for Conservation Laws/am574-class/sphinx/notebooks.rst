
.. _notebooks:

Jupyter notebooks
=================

See 

 - `jupyter.org <http://jupyter.org/>`_ for more info about the Jupyter project.

 - :ref:`python` for links to general Python documentatation and resources.

 - The tutorial video on notebooks in :ref:`lectures`.


Some notebooks available in `$AM574/notebooks`:

 - `Riemann_problem_acoustics.ipynb
   <https://nbviewer.jupyter.org/url/depts.washington.edu/clawpack/v5.4.0alpha/_static/notebooks/Riemann_problem_acoustics.ipynb>`_
   (Now in Clawpack, see `$CLAW/apps/notebooks/riemann/Riemann_problem_acoustics.ipynb`)

 - `Advection_Examples4.ipynb
   <https://nbviewer.jupyter.org/url/faculty.washington.edu/rjl/classes/am574w2017/_static/Advection_Examples4.ipynb>`_ 
   (Implements upwind and animates solution)

 - `Osher_Solution.ipynb
   <https://nbviewer.jupyter.org/url/faculty.washington.edu/rjl/classes/am574w2017/_static/Osher_Solution.ipynb>`_ 
   (Osher solution to scalar Riemann problems, with nonconvex examples)

 - `Conservation_form.ipynb
   <https://nbviewer.jupyter.org/url/faculty.washington.edu/rjl/classes/am574w2017/_static/Conservation_form.ipynb>`_
   (Animates Figure 12.5 of [FVMHP]_)

 - `burgers.ipynb <https://nbviewer.jupyter.org/url/faculty.washington.edu/rjl/classes/am574w2017/_static/burgers/burgers.ipynb>`_
   (For Homework 3, illustrating entropy fix)

Running notebooks on your computer
----------------------------------

The `$AM574/notebooks` directory (see :ref:`class_repos`) contains some
notebooks developed for this class.  You should be able to run them on your
computer if you have Jupyter installed (see `jupyter.org
<http://jupyter.org/>`_), after starting the jupyter server
using this command from the bash shell::

    $ jupyter notebook

and then navigate to the page indicated with a browser, e.g. running the
command above might produce this message::

    The Jupyter Notebook is running at: http://localhost:8888/

Viewing notebooks on Github
---------------------------

You can also view these notebooks from:
    
  - https://github.com/amath574w2017/am574-class/tree/master/notebooks

Byt you will not be able to execute cells, only view the input and whatever
output was saved with the notebook.

.. _notebooks_azure:

Running notebooks on the Windows Azure notebook server
------------------------------------------------------

The Microsoft Azure cloud computing platform now supports running notebooks
in the cloud.  You can sign up for a free account at
https://notebooks.azure.com/, and then from the page:

  - https://notebooks.azure.com/library/M49KECGcvS0

You should find some notebooks for AMath 574.  You can also create your own
notebooks, or upload ones you already have from your computer, or download
from Azure to your computer.


