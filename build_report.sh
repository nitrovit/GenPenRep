#!/bin/bash

# Directories
SECTIONS_DIR="./sections"
FINDINGS_DIR="./findings"
IMAGES_DIR="./images"
OUTPUT_DIR="./output"
TEMPLATE_FILE="./report_template.md"
OUTPUT_FILE="$OUTPUT_DIR/Final_Report"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Function to read a file's content
get_content() {
  local filepath="$1"
  if [ -f "$filepath" ]; then
    cat "$filepath"
  else
    echo "**File not found:** $filepath"
  fi
}

# Read section files
EXECUTIVE_SUMMARY=$(get_content "$SECTIONS_DIR/executive_summary.md")
INTRODUCTION=$(get_content "$SECTIONS_DIR/introduction.md")
SCOPE=$(get_content "$SECTIONS_DIR/scope.md")
METHODOLOGY=$(get_content "$SECTIONS_DIR/methodology.md")
RECOMMENDATIONS=$(get_content "$SECTIONS_DIR/recommendations.md")
CONCLUSION=$(get_content "$SECTIONS_DIR/conclusion.md")

# Combine findings
FINDINGS=""
for finding in "$FINDINGS_DIR"/*.md; do
  FINDINGS+="$(cat "$finding")"$'\n\n'
done

# Get current date
DATE=$(date '+%Y-%m-%d')

# Export variables for envsubst
export EXECUTIVE_SUMMARY
export INTRODUCTION
export SCOPE
export METHODOLOGY
export FINDINGS
export RECOMMENDATIONS
export CONCLUSION

# Generate final report markdown
echo "Generating final report markdown..."
envsubst '${EXECUTIVE_SUMMARY} ${INTRODUCTION} ${SCOPE} ${METHODOLOGY} ${FINDINGS} ${RECOMMENDATIONS} ${CONCLUSION} ${DATE}' < "$TEMPLATE_FILE" > "$OUTPUT_DIR/report.md"

# Convert markdown to PDF using the custom template
echo "Converting to PDF..."
pandoc "$OUTPUT_DIR/report.md" \
    --from markdown \
    --output "$OUTPUT_FILE.pdf" \
    --pdf-engine=xelatex \
    --template="./custom_template.tex" \
    --resource-path="$IMAGES_DIR" \
    --variable graphics \
    --highlight-style pygments \
    --toc \
    --variable logo="./images/company_logo.png" \
    --variable author="Vitaly Berdyakov" \
    --variable date="$DATE" \
    --variable title="Penetration Test Report"

# Convert markdown to Word
echo "Converting to Word..."
pandoc "$OUTPUT_DIR/report.md" \
    --from markdown \
    --output "$OUTPUT_FILE.docx" \
    --resource-path="$IMAGES_DIR" \
    --highlight-style pygments \
    --toc

# Convert markdown to HTML
echo "Converting to HTML..."
pandoc "$OUTPUT_DIR/report.md" \
    --from markdown \
    --output "$OUTPUT_FILE.html" \
    --self-contained \
    --resource-path="$IMAGES_DIR" \
    --highlight-style pygments \
    --toc

echo "Report generation complete. Files are in the $OUTPUT_DIR directory."

