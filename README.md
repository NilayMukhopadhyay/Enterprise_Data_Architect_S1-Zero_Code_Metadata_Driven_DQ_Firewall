### 🛡️ Zero-Code Metadata-Driven Data Quality Firewall

> This repository contains the backend codebase and pipeline configurations for an enterprise-grade, self-healing Data Quality Firewall built on **Microsoft Fabric**.
>
> The core objective of this project is to dynamically validate and route incoming data (to Silver, Quarantine, or Pending queues) based on centralized SQL control tables. It ensures 100% trusted data for downstream analytics, allowing business teams to update rules dynamically **without requiring a single line of PySpark code modification.**

🔗 **Full Project Documentation**
For the complete architectural breakdown, visual execution proofs of data routing, and the auto-recovery (self-healing) demonstration, please visit the full portfolio presentation here: 👉 [View Full Project Documentation on Notion](https://app.notion.com/p/Project-Summary-3e2b9932e17f807b8c7bd55a33ac033b?source=copy_link)

📂 **Repository Structure**

**1. EDAS1_SQL/ (Database Setup & Metadata)**
Contains the SQL scripts used to configure the Azure SQL environment:
* `Customer.sql` & `Orders.sql`: Source data schema and mock data injection for testing.
* `DQ_Rules.sql`: The "Brain" of the firewall; the centralized metadata control table defining thresholds and routing actions.
* `pipeline_config.sql`: Stores dynamic error threshold limits for pipeline audits.

**2. EDAS1_Notebooks/ (PySpark Engine)**
Contains the core transformation and dynamic validation logic:
* `NB_Bronze_to_Silver_DQ_Firewall.ipynb`: The master PySpark engine that parses SQL metadata rules, performs dynamic validations, routes records, and automatically recovers quarantined data upon rule updates.
* `NB_Update_WaterMark.ipynb`: Manages incremental loads by updating the high-watermark value.
* `NB_Setup_Pipeline_Metadata.ipynb` & `NB_WaterMarkTable.ipynb`: Initial setup for audit and watermark tables.

**3. EDAS1_Pipelines/ (Fabric Pipeline JSON)**
Contains the JSON export of the master orchestration pipeline:
* `PL_Master_DQ_Execution.json`: Orchestrates the end-to-end flow from Watermark Lookup ➔ Azure SQL Ingestion ➔ PySpark DQ Firewall ➔ Audit Log Generation.

⚙️ **Tech Stack**
* **Platform:** Microsoft Fabric
* **Orchestration:** Fabric Data Pipelines
* **Processing Engine:** PySpark (Python)
* **Metadata & Source:** Azure SQL Database
* **Storage:** OneLake, Delta Lake (Delta Parquet)
* **Architecture:** Metadata-driven Smart Routing, WAP (Write-Audit-Publish) Pattern
