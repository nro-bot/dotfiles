python3 -m venv ~/v3 
source ~/v3/bin/activate

pip3 install wheel
pip3 install black pylint flake8 autopep8 jedi # syntax checker

pip3 install numpy scipy matplotlib jupyterlab pandas seaborn && deactivate # data science
pip3 install pillow 
pip3 install torch torchvision opencv-python # machine learning

# pip3 install keras tensorflow gym opencv-contrib-python 

pip install jupyterlab_vim 
jupyter labextension list
