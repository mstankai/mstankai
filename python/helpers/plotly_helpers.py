# Migle Stankaityte
# ------------------------------------------
# python PLOTLY helper functions

# # import to code using:
# sys.path.insert(0, 'python/')
# import plotly_helpers

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
import plotly
import plotly.express as px
import plotly.io as pio
import plotly.figure_factory as ff
import plotly.graph_objects as go
pio.renderers.default = 'iframe'

# stats
from scipy import stats
from lmfit.models import GaussianModel

# ==========================================
# FUNTION LIST

# make_px_subplots(figures,r,c,titles,x_labels=[],y_labels=[],c_label=None) 


# ==========================================
# FUNCTIONS
# ------------------------------------------

# funtion making subplots
# required as such functionality is missing 
# for plotly express

def make_px_subplots(figures,r,c,titles,x_labels=[],y_labels=[],c_label=None) : 

    # initialise subplot figure
    sp_fig = plotly.subplots.make_subplots(rows=r, cols=c, subplot_titles=titles)
    
    # -------
    # get traces and put into subplots
    
    # initialise rows and cols
    ic = 1
    ir = 1
    
    # loop over figures
    for i, figure in enumerate(figures):
        for trace in range(len(figure["data"])):
            sp_fig.append_trace(figure["data"][trace], row=ir, col=ic)
        
        # get next location
        ic += 1      # move next figure to next col
        if ic > c :  # if cols maxed out 
            ic = 1     # reset col
            ir += 1    # next row
            
    # add axis labels
    # --------
    # define function
    def add_axis_labels(axis,labels) : 
    
        for i,l in enumerate(labels) :
            index = ''
            if i : index += str(i+1)
            sp_fig['layout'][axis+'axis'+index]['title']=l
    # --------
    
    # add labels
    add_axis_labels('x',x_labels)
    add_axis_labels('y',y_labels)

    # add colorbar label
    sp_fig['layout']['coloraxis']['colorbar']['title']=c_label    

    # return subplot fig
    return sp_fig

#---------------------------------------




    
# ==========================================
    



