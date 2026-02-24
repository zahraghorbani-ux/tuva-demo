# Oncology Cost Analysis – Zahra Ghorbani

## Executive Summary
This analysis identified patients with active cancer using claims-based ICD-10 diagnoses and evaluated healthcare utilization and costs during the first 12 months following diagnosis.

Care is primarily delivered in **office-based and outpatient settings**, which account for most encounters. However, **inpatient care represents the largest share of total spending**, despite being relatively rare, highlighting hospitalizations as a key cost driver.

Patient mix is dominated by **non-melanoma skin cancer and prostate cancer**, but a disproportionate share of spending is associated with smaller segments such as **kidney cancer and other less common cancer types**.

Service-level analysis further shows that **pharmacy and laboratory services drive a large portion of utilization and cost**, while **emergency and ambulance encounters, though less frequent, are comparatively expensive**.

Overall, oncology spending appears concentrated in **high-cost acute events, medication-related care, and a relatively small subset of patients**, suggesting opportunities for deeper investigation into the drivers of these high-cost segments.

-- This analysis was completed as part of a technical assessment to explore how claims data can be used to identify cancer populations and understand healthcare costs.

## Project Overview
Color wondering how we may be able to use claims data for identifying savings and outcomes opportunities for our patients. Billing data is relatively new at Color so we will start with an exploration around how best to use that data to find patients undergoing active cancer treatment and what their top drivers of cost are. 

## Methodology
• Identified patients with cancer using ICD-10 diagnosis codes beginning with "C".
• The earliest cancer diagnosis date was used as the first cancer date.
• Claims and encounters were analyzed during the first 12 months following diagnosis.
• Costs were calculated using paid_amount.
• Analysis was built on top of Tuva’s standardized core models.

## Segmentation
Patients were segmented using:
• Primary cancer type  
• Total spend bucket  
• Share of spend related to cancer  
• Care setting (inpatient, outpatient, office-based, other)

## Key Findings
• Inpatient encounters represent a small share of utilization but drive the largest portion of spending.
• Most care occurs in office-based and outpatient settings.
• Pharmacy and laboratory services account for a large share of oncology utilization and cost.
• Non-melanoma skin cancer and prostate cancer represent the largest portion of patients, while smaller segments such as kidney cancer contribute disproportionately to total spending.
## Data Model
The dbt project follows a layered structure:

Staging → standardize source tables  
Intermediate → cohort creation and transformations  
Marts → analytical datasets for cost, utilization, and segmentation

## Additional Analysis

Supporting exploratory analysis and pivot tables were created in Google Sheets to validate trends and summarize results.
https://docs.google.com/spreadsheets/d/1McWLUkcyAd3D4pY0MOXWNP5BtLY8S0fOFZpBURgRzFU/edit?usp=sharing

## AI Usage Log
AI tools were used to:
• Assist with query refactoring and debugging
• Help summarize analytical findings
• Documentation drafting


All SQL logic and analytical decisions were reviewed and validated manually.







[![Apache License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![dbt logo and version](https://img.shields.io/static/v1?logo=dbt&label=dbt-version&message=1.5.x&color=orange)

# The Tuva Project Demo

## 🧰 What does this project do?

This demo provides a quick and easy way to run the Tuva Project 
Package in a dbt project with synthetic data for 1k patients loaded as dbt seeds.

To set up the Tuva Project with your own claims data or to better understand what the Tuva Project does, please review the ReadMe in [The Tuva Project](https://github.com/tuva-health/the_tuva_project) package for a detailed walkthrough and setup.

For information on the data models check out our [Docs](https://thetuvaproject.com/).

## ✅ How to get started

### Pre-requisites
You only need one thing installed:
1. [uv](https://docs.astral.sh/uv/getting-started/) - a fast Python package manager. Installation is simple and OS-agnostic:
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```
   Or on Windows:
   ```powershell
   powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
   ```

**Note:** This demo uses DuckDB as the database, so you don't need to configure a connection to an external data warehouse. Everything is configured and ready to go!

### Getting Started
Complete the following steps to run the demo:

1. [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) this repo to your local machine or environment.
1. In the project directory, install Python dependencies and set up the virtual environment:
   ```bash
   uv sync
   ```
1. Activate the virtual environment:
   ```bash
   source .venv/bin/activate  # On macOS/Linux
   # or on Windows:
   .venv\Scripts\activate
   ```
1. Run `dbt deps` to install the Tuva Project package:
   ```bash
   dbt deps
   ```
1. Run `dbt build` to run the entire project with the built-in sample data:
   ```bash
   dbt build
   ```

The `profiles.yml` file is already included in this repo and pre-configured for DuckDB, so no additional setup is needed!

### Using uv commands
You can also run dbt commands directly with `uv run` without activating the virtual environment:
```bash
uv run dbt deps
uv run dbt build
```

## 🤝 Community

Join our growing community of healthcare data practitioners on [Slack](https://join.slack.com/t/thetuvaproject/shared_invite/zt-16iz61187-G522Mc2WGA2mHF57e0il0Q)!
