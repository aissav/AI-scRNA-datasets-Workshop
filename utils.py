import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import scanpy
import os
import copy
from tqdm import tqdm, notebook
import scib as sc
from rpy2 import robjects
import re
import anndata2ri
from scipy import sparse
import warnings
import math
warnings.filterwarnings('ignore')
import time
from utils import *
import sys
class HiddenPrints:
    def __enter__(self):
        self._original_stdout = sys.stdout
        sys.stdout = open(os.devnull, 'w')

    def __exit__(self, exc_type, exc_val, exc_tb):
        sys.stdout.close()
        sys.stdout = self._original_stdout
        
        
def convert_r_object_to_scannpy(filename):
    adata_output = sc.pp.read_seurat(filename)
    scanpy.write(adata=adata_output, filename=filename)
    
    return scanpy.read_h5ad(filename)