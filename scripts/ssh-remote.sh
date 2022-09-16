for f in `cat controllers.txt`; do echo "### $f ###"; ssh $f free -m; done |mail -s "Controllers health" grouph@topnet.tn
