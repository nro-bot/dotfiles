# Install machine learning basics 
python3 -m venv ~/v3 
source ~/v3/bin/activate
pip install --upgrade pip

pip3 install wheel
pip3 install black pylint flake8 autopep8 jedi

pip3 install numpy scipy matplotlib jupyterlab pandas seaborn && deactivate
pip3 install pillow 
pip3 install torch torchvision opencv-python 
# pip3 install keras tensorflow gym opencv-contrib-python 

deactivate
