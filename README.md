# Penetration Testing Report Generator

This project automates the generation of penetration testing reports in PDF, Word, and HTML formats by combining markdown files using a custom build script and Pandoc. The reports include a title page, table of contents, and formatted sections with images and captions.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Quickstart](#quickstart)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Features

- Combine multiple markdown files into a single report.
- Generate reports in PDF, Word, and HTML formats.
- Customizable LaTeX template for PDF output.
- Automatically generate a table of contents.
- Include images with captions and proper formatting.
- Control over section numbering and formatting.

## Prerequisites

Before you begin, ensure you have the following tools installed on your system:

- **Pandoc**: A universal document converter.
- **LaTeX Distribution**: Required for PDF generation via Pandoc.
  - **TeX Live** (recommended for Linux users) or **MikTeX** (recommended for Windows users).
- **Bash Shell**: For running the build script (`build_report.sh`).
- **GNU `gettext` Utilities**: Provides the `envsubst` command used in the script.
- **Git**: For cloning the repository.

### Installation of Prerequisites

#### Pandoc

- **Ubuntu/Debian:**

  ```bash
  sudo apt-get update
  sudo apt-get install pandoc
  ```

- **CentOS/RHEL:**

  ```bash
  sudo yum install pandoc
  ```

- **macOS (using Homebrew):**

  ```bash
  brew install pandoc
  ```

- **Windows:**

  Download and install Pandoc from [pandoc.org](https://pandoc.org/installing.html).

#### LaTeX Distribution

- **Ubuntu/Debian:**

  ```bash
  sudo apt-get install texlive-full
  ```

- **CentOS/RHEL:**

  ```bash
  sudo yum install texlive texlive-latex
  ```

- **macOS (using Homebrew):**

  ```bash
  brew install --cask mactex-no-gui
  ```

- **Windows:**

  Download and install **MikTeX** from [miktex.org](https://miktex.org/download).

#### GNU `gettext` Utilities

- **Ubuntu/Debian:**

  ```bash
  sudo apt-get install gettext
  ```

- **CentOS/RHEL:**

  ```bash
  sudo yum install gettext
  ```

- **macOS (using Homebrew):**

  ```bash
  brew install gettext
  brew link --force gettext
  ```

#### Git

- **Ubuntu/Debian:**

  ```bash
  sudo apt-get install git
  ```

- **CentOS/RHEL:**

  ```bash
  sudo yum install git
  ```

- **macOS (using Homebrew):**

  ```bash
  brew install git
  ```

- **Windows:**

  Download and install Git from [git-scm.com](https://git-scm.com/download/win).

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/yourrepository.git
```

Navigate to the project directory:

```bash
cd yourrepository
```

## Project Structure

```
project/
├── build_report.sh
├── report_template.md
├── custom_template.tex
├── sections/
│   ├── executive_summary.md
│   ├── introduction.md
│   ├── scope.md
│   ├── methodology.md
│   ├── recommendations.md
│   └── conclusion.md
├── findings/
│   ├── finding1.md
│   ├── finding2.md
│   └── finding3.md
├── images/
│   ├── image1.png
│   ├── image2.png
│   └── company_logo.png
└── output/
```

- **build_report.sh**: The main build script.
- **report_template.md**: The markdown template for the report.
- **custom_template.tex**: Custom LaTeX template for PDF formatting.
- **sections/**: Directory containing section markdown files.
- **findings/**: Directory containing individual finding markdown files.
- **images/**: Directory containing images used in the report.
- **output/**: Directory where the generated reports will be saved.

## Usage

### Making the Build Script Executable

Ensure the `build_report.sh` script has executable permissions:

```bash
chmod +x build_report.sh
```

### Running the Build Script

Execute the script from the project directory:

```bash
./build_report.sh
```

This script will:

- Combine markdown files from `sections/` and `findings/`.
- Generate a final `report.md` file in the `output/` directory.
- Convert `report.md` to PDF, Word, and HTML formats using Pandoc.
- Save the generated reports in the `output/` directory.

### Output

After running the script, you will find the following files in the `output/` directory:

- **Final_Report.pdf**
- **Final_Report.docx**
- **Final_Report.html**
- **report.md**

## Quickstart

To quickly get started on a new machine:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/yourrepository.git
   cd yourrepository
   ```

2. **Install prerequisites:**

   - Follow the instructions in the [Prerequisites](#prerequisites) section to install Pandoc, LaTeX, `gettext`, and Git.

3. **Make the build script executable:**

   ```bash
   chmod +x build_report.sh
   ```

4. **Run the build script:**

   ```bash
   ./build_report.sh
   ```

5. **Check the output:**

   Open the generated reports in the `output/` directory.

## Customization

### Editing the Report Content

- **Sections:**

  Edit the markdown files in the `sections/` directory to modify the content of each section.

- **Findings:**

  Add or edit markdown files in the `findings/` directory to include individual findings. The findings will be automatically included in the report.

### Adding Images

Place image files in the `images/` directory and reference them in your markdown files:

```markdown
![Caption for the image](../images/your_image.png)
```

### Customizing the LaTeX Template

Modify the `custom_template.tex` file to change the appearance of the PDF report, including fonts, spacing, headers, footers, and more.

## Troubleshooting

- **Images Not Displaying:**

  - Ensure the image paths are correct and images are located in the `images/` directory.
  - Use relative paths when referencing images in markdown files.

- **Pandoc Errors During Conversion:**

  - Verify that all prerequisites are installed and up to date.
  - Check for syntax errors in your markdown files.
  - Review error messages for specific issues.

- **Permissions Errors:**

  - Ensure that `build_report.sh` has executable permissions.
  - Check file permissions in the project directory.

- **LaTeX Compilation Errors:**

  - Make sure your LaTeX distribution includes all required packages.
  - Update your LaTeX distribution if necessary.

## License

This project is licensed under the [MIT License](LICENSE).

---

**Note:** Replace `https://github.com/yourusername/yourrepository.git` with the actual URL of your repository. Also, update any paths or filenames if they differ in your project.

Feel free to reach out if you have any questions or need further assistance!

