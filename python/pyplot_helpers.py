# Migle Stankaityte
# ------------------------------------------
# python helper functions

# # import to code using:
# sys.path.insert(0, 'python/')
# import pyplot_helpers

# ------------------------------------------

#import

# >> general
import sys, os, re
import numpy as np
from scipy import stats

# >> data frames
import pandas as pd
pd.plotting.register_matplotlib_converters()

# >> plotting
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib import rc
import seaborn as sns


# plotly
import plotly.express as px
import plotly.io as pio
import plotly.figure_factory as ff
pio.renderers.default = 'iframe'

# stats
from scipy import stats
from lmfit.models import GaussianModel

# ==========================================
# funtion drawing a linear regresion 
# fit result in graph 

def draw_LR_fitresult(x,y 			   # data
					  ,ax			   # axes
                      ,debug=False     # debug
                      ,fsize=12        # font size
                      ,tag=""          # title label
                      ,loc=(0.05,0.95) # location
					  ):

    # get fit result
    fit_res = stats.linregress(x,y)
    
    # extract values
    # Y = aX + c
    a, c, R, p, a_err = stats.linregress(x,y)
    c_err = fit_res.intercept_stderr
    
    # R squared --> correlation % 
    R_sq = R**2
    
    # write strings
    fitres_str = {
        "a"      : "{:5.2f} +- {:5.2f}".format(a,a_err),
        "c"      : "{:5.2f} +- {:5.2f}".format(c,c_err),
        "R^2"    : "{:.2f}%".format(R_sq*100),
        "p val." : "{:.0e}".format(p)
    }
    
    # print info to screen
    if debug:
        for key, val in fitres_str.items() : print(key+"\t"+val)
    
    # define text as single string
    fit_info_str = "Fit Results: {:s}\n".format(tag)
    
    for key, val in fitres_str.items() : 
        fit_info_str += "\n" + key + ":   " + val
        

    # box properties - cosmetic
    box_props = { 'boxstyle' : 'square', 
                  'facecolor' : 'white', 
                  'alpha' : 0.5
                }

    
    # draw text box
    ax.text(loc[0], loc[1] 
            ,fit_info_str 
            ,transform=ax.transAxes 
            ,fontsize=fsize
            ,verticalalignment='top' 
            ,bbox=box_props)
    
# ==========================================
    



