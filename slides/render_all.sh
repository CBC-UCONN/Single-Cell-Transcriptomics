for file in *.qmd; do
    quarto render "$file"
done
