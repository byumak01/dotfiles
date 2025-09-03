#!/bin/bash

# PDF Batch Compressor Script
# Compresses multiple PDFs while preserving quality

# Configuration
INPUT_DIR="."  # Current directory, change as needed
OUTPUT_DIR="compressed"  # Output directory
QUALITY="ebook"  # Options: prepress, printer, ebook, screen
COLOR_RES=200    # Color image resolution (150-300 recommended)
GRAY_RES=200     # Grayscale image resolution
MONO_RES=300     # Monochrome (text) resolution

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to format file size
format_size() {
    local size=$1
    if [ $size -gt 1048576 ]; then
        echo "$(($size / 1048576)) MB"
    elif [ $size -gt 1024 ]; then
        echo "$(($size / 1024)) KB"
    else
        echo "$size bytes"
    fi
}

# Function to compress a single PDF
compress_pdf() {
    local input_file="$1"
    local output_file="$2"
    
    # Get original file size
    local original_size=$(stat -c%s "$input_file" 2>/dev/null || stat -f%z "$input_file" 2>/dev/null)
    
    print_status "Compressing: $(basename "$input_file")"
    
    # Ghostscript compression command with quality preservation
    if gs -sDEVICE=pdfwrite \
        -dCompatibilityLevel=1.4 \
        -dPDFSETTINGS=/$QUALITY \
        -dNOPAUSE -dQUIET -dBATCH \
        -dColorImageDownsampleType=/Bicubic \
        -dColorImageResolution=$COLOR_RES \
        -dGrayImageDownsampleType=/Bicubic \
        -dGrayImageResolution=$GRAY_RES \
        -dMonoImageDownsampleType=/Bicubic \
        -dMonoImageResolution=$MONO_RES \
        -dOptimize=true \
        -dEmbedAllFonts=true \
        -dSubsetFonts=true \
        -dAutoRotatePages=/None \
        -sOutputFile="$output_file" \
        "$input_file" 2>/dev/null; then
        
        # Get compressed file size
        local compressed_size=$(stat -c%s "$output_file" 2>/dev/null || stat -f%z "$output_file" 2>/dev/null)
        
        # Calculate compression ratio
        local ratio=$((100 - (compressed_size * 100 / original_size)))
        
        print_success "$(basename "$input_file") → $(basename "$output_file")"
        echo "          Original: $(format_size $original_size), Compressed: $(format_size $compressed_size), Saved: ${ratio}%"
        
        return 0
    else
        print_error "Failed to compress: $(basename "$input_file")"
        return 1
    fi
}

# Main script
main() {
    print_status "PDF Batch Compressor Starting..."
    print_status "Quality setting: $QUALITY"
    print_status "Resolution settings - Color: ${COLOR_RES}dpi, Gray: ${GRAY_RES}dpi, Mono: ${MONO_RES}dpi"
    
    # Check if ghostscript is installed
    if ! command -v gs &> /dev/null; then
        print_error "Ghostscript (gs) is not installed. Please install it first."
        print_status "Ubuntu/Debian: sudo apt install ghostscript"
        print_status "CentOS/RHEL: sudo yum install ghostscript"
        print_status "macOS: brew install ghostscript"
        exit 1
    fi
    
    # Create output directory if it doesn't exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
        print_status "Created output directory: $OUTPUT_DIR"
    fi
    
    # Find all PDF files
    pdf_files=()
    while IFS= read -r -d '' file; do
        pdf_files+=("$file")
    done < <(find "$INPUT_DIR" -maxdepth 1 -name "*.pdf" -type f -print0)
    
    if [ ${#pdf_files[@]} -eq 0 ]; then
        print_warning "No PDF files found in $INPUT_DIR"
        exit 0
    fi
    
    print_status "Found ${#pdf_files[@]} PDF file(s) to process"
    echo
    
    # Process each PDF
    local success_count=0
    local total_original_size=0
    local total_compressed_size=0
    
    for pdf_file in "${pdf_files[@]}"; do
        local filename=$(basename "$pdf_file")
        local output_file="$OUTPUT_DIR/$filename"
        
        # Skip if output file already exists (optional: add -f flag to force overwrite)
        if [ -f "$output_file" ]; then
            print_warning "Skipping $filename (output file already exists)"
            continue
        fi
        
        # Get original size for totals
        local orig_size=$(stat -c%s "$pdf_file" 2>/dev/null || stat -f%z "$pdf_file" 2>/dev/null)
        total_original_size=$((total_original_size + orig_size))
        
        if compress_pdf "$pdf_file" "$output_file"; then
            local comp_size=$(stat -c%s "$output_file" 2>/dev/null || stat -f%z "$output_file" 2>/dev/null)
            total_compressed_size=$((total_compressed_size + comp_size))
            ((success_count++))
        fi
        echo
    done
    
    # Print summary
    echo "=" | tr ' ' '='
    print_status "Processing Complete!"
    print_success "$success_count out of ${#pdf_files[@]} files processed successfully"
    
    if [ $success_count -gt 0 ]; then
        local total_ratio=$((100 - (total_compressed_size * 100 / total_original_size)))
        echo "Total original size: $(format_size $total_original_size)"
        echo "Total compressed size: $(format_size $total_compressed_size)"
        echo "Total space saved: ${total_ratio}%"
    fi
    
    print_status "Compressed files saved in: $OUTPUT_DIR"
}

# Help function
show_help() {
    cat << EOF
PDF Batch Compressor - Compress multiple PDFs while preserving quality

Usage: $0 [OPTIONS]

Options:
    -h, --help          Show this help message
    -i, --input DIR     Input directory (default: current directory)
    -o, --output DIR    Output directory (default: compressed)
    -q, --quality LEVEL Quality level: prepress, printer, ebook, screen (default: ebook)
    -c, --color-res DPI Color image resolution (default: 200)
    -g, --gray-res DPI  Grayscale image resolution (default: 200)
    -m, --mono-res DPI  Monochrome image resolution (default: 300)

Quality levels:
    prepress: Highest quality, largest file size
    printer:  High quality for printing
    ebook:    Good balance of quality and size (recommended)
    screen:   Lower quality, smallest file size

Examples:
    $0                                    # Compress all PDFs in current directory
    $0 -i /path/to/pdfs -o /path/output  # Specify input and output directories
    $0 -q printer -c 300 -g 300          # Use printer quality with higher resolution

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -i|--input)
            INPUT_DIR="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -q|--quality)
            QUALITY="$2"
            shift 2
            ;;
        -c|--color-res)
            COLOR_RES="$2"
            shift 2
            ;;
        -g|--gray-res)
            GRAY_RES="$2"
            shift 2
            ;;
        -m|--mono-res)
            MONO_RES="$2"
            shift 2
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use -h or --help for usage information"
            exit 1
            ;;
    esac
done

# Validate quality setting
case $QUALITY in
    prepress|printer|ebook|screen)
        ;;
    *)
        print_error "Invalid quality setting: $QUALITY"
        print_error "Valid options: prepress, printer, ebook, screen"
        exit 1
        ;;
esac

# Run main function
main
