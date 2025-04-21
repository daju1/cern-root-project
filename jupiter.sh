# source root/bin/thisroot.sh


ROOTSYS=/opt/root

jupyter kernelspec install $ROOTSYS/etc/notebook/kernels/root --user

root --notebook --ip=0.0.0.0 --allow-root
