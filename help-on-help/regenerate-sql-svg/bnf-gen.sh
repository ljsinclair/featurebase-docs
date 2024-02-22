echo "Have you updated sql3.ebnf? (yes/no)"
  read requirements
  if [[ "$requirements" == y* ]]; then
    echo "Pull latest"
      git pull
    echo "--> Generate bnf files"
      bash makebnf.sh
    echo "--> Extract the svg files"
      python3 extract.py
    echo "--> Check if your updated file exists:"
     ls ~/featurebase-docs/assets/images/sql-guide
    echo "--> And scroll-up and fix any errors (ignore missing references)"
  else
    echo "Computer says NO."
  fi
