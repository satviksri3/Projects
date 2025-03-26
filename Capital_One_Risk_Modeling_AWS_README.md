
## Capital One Risk Modeling & ML Pipeline (AWS)

### Project Overview
This project builds a **risk assessment ML pipeline** using **Amazon SageMaker** to analyze Capital One’s risk data. It includes **data preprocessing, model training, deployment, and monitoring** to support real-time risk analytics.

### Architecture
- **AWS S3**: Stores raw and processed data.
- **AWS Glue**: ETL jobs for data transformation.
- **Amazon SageMaker**: Model training, tuning, and deployment.
- **Lambda & API Gateway**: Enables real-time inference.
- **CloudWatch**: Monitors model drift and performance.
- **Power BI**: Visualizes predictions and insights.

### Setup & Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/capitalone-risk-ml.git
   cd capitalone-risk-ml
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Configure AWS credentials:
   ```bash
   aws configure
   ```
4. Run ETL pipeline:
   ```bash
   python etl_pipeline.py
   ```
5. Train and deploy model:
   ```bash
   python train_deploy.py
   ```
6. Monitor performance:
   ```bash
   python monitor_model.py
   ```

### Usage
- Upload new risk data to **S3**.
- Model automatically retrains if drift is detected.
- Use the API endpoint to get risk predictions.
- View insights in **Power BI**.

---

## Real-Time Data Pipeline & Analytics (GCP)

### Project Overview
This project builds a **real-time ETL pipeline** using **Google Cloud Dataflow** (Apache Beam) to process streaming data, store it in **BigQuery**, and visualize insights in **Looker Studio**.

### Architecture
- **Pub/Sub**: Ingests streaming data.
- **Cloud Dataflow**: Processes and transforms data in real-time.
- **BigQuery**: Stores processed data for analytics.
- **Cloud Composer (Airflow)**: Manages workflows.
- **Looker Studio**: Provides real-time visualizations.

### Setup & Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/gcp-realtime-pipeline.git
   cd gcp-realtime-pipeline
   ```
2. Authenticate with GCP:
   ```bash
   gcloud auth application-default login
   ```
3. Deploy Dataflow pipeline:
   ```bash
   python dataflow_pipeline.py --runner=DataflowRunner --project=your-gcp-project --region=your-region
   ```
4. Configure Airflow in **Cloud Composer**:
   - Upload DAGs to **GCS bucket**.
   - Enable DAG in **Cloud Composer UI**.
5. Set up Looker Studio:
   - Connect to **BigQuery dataset**.
   - Create real-time visualizations.

### Usage
- Ingest data via **Pub/Sub**.
- Processed data is stored in **BigQuery**.
- Use Looker Studio for real-time dashboards.
- Monitor pipeline with **Cloud Composer**.

### Future Enhancements
- Implement **Dataform** for SQL transformations.
- Add ML-based anomaly detection in Dataflow.
- Optimize cost efficiency with **partitioned tables** in BigQuery.
