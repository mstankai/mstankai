# Migle Stankaityte
# ------------------------------------------
# pandas helper functions

# # import to code using:
# sys.path.insert(0, 'python/')
# import pd_helpers

# ------------------------------------------

#import

# >> general
import sys, os, re
import numpy as np

# >> data frames
import pandas as pd
pd.plotting.register_matplotlib_converters()

# stats
from scipy import stats
#from lmfit.models import 

# ==========================================
# FUNTION LIST

# pd_headtail(df,N=3) 


# ==========================================
# FUNCTIONS
# ------------------------------------------

# gives the head and tail of the dataframe

def pd_headtail(df,N=3) : 
    """
    Returns a dataframe with N head and tail rows.
    """

    return pd.concat([df.head(N),df.tail(N)])

# ------------------------------------------


# ==========================================

