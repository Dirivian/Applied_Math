
""" 
Set up the plot figures, axes, and items to be done for each frame.

This module is imported by the plotting routines and then the
function setplot is called to set the plot parameters.
    
""" 

from __future__ import absolute_import
from __future__ import print_function
from clawpack.clawutil.data import ClawData

probdata = ClawData()
probdata.read('setprob.data', force=True)
q1 = probdata.q1
q2 = probdata.q2
print("Parameters: q1 = %g, q2 = %g, efix = %s" \
    % (q1, q2, probdata.efix))

f = lambda q: 0.5 * q**2  # flux function
fp = lambda q: q          # char. speed f'(q)

def qtrue(x,t):
    from numpy import abs, where

    q = None  # default if true solution not defined

    # shock speed: 
    s = (f(q1) - f(q2)) / (q1-q2)

    if s<0 or q1>=q2:
        # not set up to handle these cases
        return q

    # time shock catches up to rarefaction:
    t1 = abs(2. / (s - fp(q1)))
    # time rarefaction catches up to shock:
    t2 = abs(2. / (s - fp(q2)))

    if t > min(t1,t2):
        # not set up to handle these cases
        return q

    # shock and rarefaction are separated:
    xs = -2. + s*t   # shock location
    xr1 = fp(q1)*t   # left edge of rarefaction
    xr2 = fp(q2)*t   # right edge of rarefaction
    q = x/t  # correct in rarefaction wave
    q = where(x<=xr1, q1, q)  # fix to left of rarefaction
    q = where(x>xr2, q2, q)  # fix to right of rarefaction
    q = where(x<xs, q2, q)  # fix near left boundary
    return q
    

# Function to plot true solution for comparison:
def plot_qtrue(current_data):
    from pylab import plot, legend
    x = current_data.x
    t = current_data.t
    q = qtrue(x,t)
    if q is not None:
        plot(x,q,'r',label='true solution')
        legend()

#--------------------------
def setplot(plotdata):
#--------------------------
    
    """ 
    Specify what is to be plotted at each frame.
    Input:  plotdata, an instance of clawpack.visclaw.data.ClawPlotData.
    Output: a modified version of plotdata.
    
    """ 

    plotdata.clearfigures()  # clear any old figures,axes,items data


    # Figure for q[0]
    plotfigure = plotdata.new_plotfigure(name='q[0]', figno=1)

    # Set up for axes in this figure:
    plotaxes = plotfigure.new_plotaxes(name='Solution')
    plotaxes.xlimits = 'auto'
    plotaxes.ylimits = [-3,3]
    plotaxes.title = 'q[0]'
    plotaxes.afteraxes = plot_qtrue

    # Set up for item on these axes:
    plotitem = plotaxes.new_plotitem(name='solution', plot_type='1d')
    plotitem.plot_var = 0
    plotitem.plotstyle = 'o'
    plotitem.color = 'b'
    plotitem.show = True       # show on plot?
    
    # Parameters used only when creating html and/or latex hardcopy
    # e.g., via clawpack.visclaw.frametools.printframes:

    plotdata.printfigs = True                # print figures
    plotdata.print_format = 'png'            # file format
    plotdata.print_framenos = 'all'          # list of frames to print
    plotdata.print_fignos = 'all'            # list of figures to print
    plotdata.html = True                     # create html files of plots?
    plotdata.html_homelink = '../README.html'   # pointer for top of index
    plotdata.latex = True                    # create latex file of plots?
    plotdata.latex_figsperline = 2           # layout of plots
    plotdata.latex_framesperline = 1         # layout of plots
    plotdata.latex_makepdf = False           # also run pdflatex?

    return plotdata

    
